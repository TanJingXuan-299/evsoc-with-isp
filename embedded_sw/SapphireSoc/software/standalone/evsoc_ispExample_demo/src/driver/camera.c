////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2026 Efinix Inc. All rights reserved.
// See https://github.com/Efinix-Inc/evsoc/blob/main/LICENSE.txt for details.
////////////////////////////////////////////////////////////////////////////////

#include "camera.h"
#include "common.h"
#include "i2c.h"
#include "PiCamDriver.h"
#include "PiCamV3Driver.h"
#include "apb3_cam.h"
// Add additional camera drivers if required.

// -------------------------------------------------------
// Config table
// -------------------------------------------------------

typedef struct
{
    u8 slaveAddress;
    CameraType type;
    const char *name;
    void (*init)(u32 i2cCtrl);
    void (*start_stream)(u32 i2cCtrl);
} CameraEntry;

static const CameraEntry supportedCamera[] = {
    {0x10 << 1, CAMERA_IMX219, "PiCam v2 (IMX219)", PiCam_init, NULL},
    {0x1A << 1, CAMERA_IMX708, "PiCam v3 (IMX708)", PiCamV3_Init, PiCamV3_StartStreaming},
    /*  { slaveAddress, CAMERA_TYPE, "CAMERA_NAME"     , CAMERA_INIT , CAMERA_START_STREAM  },*/
};

#define NUM_KNOWN_CAMERAS (sizeof(supportedCamera) / sizeof(supportedCamera[0]))

// -------------------------------------------------------
// I2C
// -------------------------------------------------------

static int mipi_i2c_probe(u32 i2cCtrl, u8 slaveAddress)
{
    i2c_masterStartBlocking(i2cCtrl);
    i2c_txByte(i2cCtrl, slaveAddress);
    i2c_txNackBlocking(i2cCtrl);
    return i2c_rxAck(i2cCtrl);
}

// -------------------------------------------------------
// Core: probe all known i2c addresses, runs init + stream + set_rgb_gain
// -------------------------------------------------------

static void camera_init(int camSlot, u32 i2cCtrl)
{
    mipi_i2c_init(i2cCtrl);

    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    {
        if (mipi_i2c_probe(i2cCtrl, supportedCamera[i].slaveAddress) == 1)
        {
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
                       camSlot,
                       supportedCamera[i].name,
                       supportedCamera[i].slaveAddress >> 1);

            if (supportedCamera[i].init != NULL)
                supportedCamera[i].init(i2cCtrl);

            if (supportedCamera[i].start_stream != NULL)
                supportedCamera[i].start_stream(i2cCtrl);
            return;
        }
    }

    bsp_printf("cam%d detected: None\n", camSlot);
}

// -------------------------------------------------------
// API - 1 call per camera
// -------------------------------------------------------

void cam0_init(u32 i2cCtrl) { camera_init(0, i2cCtrl); }
void cam1_init(u32 i2cCtrl) { camera_init(1, i2cCtrl); }

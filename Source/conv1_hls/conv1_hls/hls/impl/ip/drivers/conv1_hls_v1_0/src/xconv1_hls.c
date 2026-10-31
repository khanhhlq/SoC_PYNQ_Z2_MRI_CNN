// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2026.1 (64-bit)
// Tool Version Limit: 2026.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xconv1_hls.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XConv1_hls_CfgInitialize(XConv1_hls *InstancePtr, XConv1_hls_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XConv1_hls_Start(XConv1_hls *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv1_hls_ReadReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_AP_CTRL) & 0x80;
    XConv1_hls_WriteReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XConv1_hls_IsDone(XConv1_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv1_hls_ReadReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XConv1_hls_IsIdle(XConv1_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv1_hls_ReadReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XConv1_hls_IsReady(XConv1_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv1_hls_ReadReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XConv1_hls_EnableAutoRestart(XConv1_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv1_hls_WriteReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XConv1_hls_DisableAutoRestart(XConv1_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv1_hls_WriteReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_AP_CTRL, 0);
}

void XConv1_hls_InterruptGlobalEnable(XConv1_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv1_hls_WriteReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_GIE, 1);
}

void XConv1_hls_InterruptGlobalDisable(XConv1_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv1_hls_WriteReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_GIE, 0);
}

void XConv1_hls_InterruptEnable(XConv1_hls *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XConv1_hls_ReadReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_IER);
    XConv1_hls_WriteReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_IER, Register | Mask);
}

void XConv1_hls_InterruptDisable(XConv1_hls *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XConv1_hls_ReadReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_IER);
    XConv1_hls_WriteReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_IER, Register & (~Mask));
}

void XConv1_hls_InterruptClear(XConv1_hls *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv1_hls_WriteReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_ISR, Mask);
}

u32 XConv1_hls_InterruptGetEnabled(XConv1_hls *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XConv1_hls_ReadReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_IER);
}

u32 XConv1_hls_InterruptGetStatus(XConv1_hls *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XConv1_hls_ReadReg(InstancePtr->Control_BaseAddress, XCONV1_HLS_CONTROL_ADDR_ISR);
}


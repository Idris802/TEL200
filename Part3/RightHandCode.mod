PROC Main()
        g_Init;
        g_GripOut;
        WaitDI di_Test1, 1; Test1;
        WaitDI di_Test2, 1; Test2;
        WaitDI di_Test3, 1; Test3;
    ENDPROC
    PROC Test1()
        MoveAbsJ Home,v200,fine,Servo\WObj:=wobj0;
        MoveJ PickPipe1,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        g_GripIn;
        MoveJ Up1,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        MoveJ Center,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        WaitDi di_StopMixing0, 1;
        MoveJ Up1,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        MoveJ PickPipe1,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        g_GripOut;
        MoveAbsJ Home,v200,fine,Servo\WObj:=wobj0;
    ENDPROC
    PROC Test2()
        MoveAbsJ Home,v200,fine,Servo\WObj:=wobj0;
        MoveJ PickPipe2,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        g_GripIn;
        MoveJ Up2,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        MoveJ Center,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        WaitDi di_StopMixing0, 1;
        MoveJ Up2,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        MoveJ PickPipe2,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        g_GripOut;
        MoveAbsJ Home,v200,fine,Servo\WObj:=wobj0;
    ENDPROC
    PROC Test3()
        MoveAbsJ Home,v200,fine,Servo\WObj:=wobj0;
        MoveJ PickPipe3,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        g_GripIn;
        MoveJ Up3,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        MoveJ Center,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        WaitDi di_StopMixing0, 1;
        MoveJ Up3,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        MoveJ PickPipe3,v200,fine,Servo\WObj:=FrameForPipeHoldersBox;
        g_GripOut;
        MoveAbsJ Home,v200,fine,Servo\WObj:=wobj0;
    ENDPROC
ENDMODULE

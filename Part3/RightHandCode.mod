MODULE Module1
    
    CONST jointtarget Home:=[[0,-130,30,0,40,0],[-135,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PickPipe1:=[[14.247324661,23.608219309,74.08982754],[0,0,0.707106781,0.707106781],[1,0,-1,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Up1:=[[14.247324661,23.608219309,154.08982754],[0,0,0.707106781,0.707106781],[1,0,-1,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Rotate1:=[[14.247324661,23.608219309,124.08982754],[0.5,0.5,-0.5,-0.5],[1,0,-1,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Center:=[[-165.752675339,23.608219309,154.08982754],[0.5,0.5,-0.5,-0.5],[1,0,-1,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PickPipe2:=[[60.979324661,24.195219309,74.24382754],[0,0,0.707106781,0.707106781],[1,0,-1,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Up2:=[[60.979324661,24.195219309,154.24382754],[0,0,0.707106781,0.707106781],[1,0,-1,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PickPipe3:=[[105.978324661,24.543219309,73.99182754],[0,0,0.707106781,0.707106781],[1,0,-1,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Up3:=[[105.978324661,24.543219309,153.99182754],[0,0,0.707106781,0.707106781],[1,0,-1,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
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

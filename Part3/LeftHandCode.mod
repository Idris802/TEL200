PROC Main()
        g_Init;
        g_GripOut;
        WaitDI di_Test1, 1; Test1;
        WaitDI di_Test2, 1; Test2;
        WaitDI di_Test3, 1; Test3;
    ENDPROC
    PROC Test1()
        MoveAbsJ Home,v200,fine,Servo\WObj:=NoseFame;
        MoveJ Up1,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ PickSwab1,v200,fine,Servo\WObj:=FrameForSwabBox;
        g_GripIn;
        MoveJ Up1,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ OutsideNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ InNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ OutsideNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ SwabAbovePipe,v200,fine,Servo\WObj:=MixingFrame;
        MoveJ SwabInPipe,v200,fine,Servo\WObj:=MixingFrame;
        WaitDI di_StopMixing0, 1;
        MoveJ Up1,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ PickSwab1,v200,fine,Servo\WObj:=FrameForSwabBox;
        g_GripOut;
        MoveAbsJ Home,v200,fine,Servo\WObj:=NoseFame;
    ENDPROC
    PROC Test2()
        MoveAbsJ Home,v200,fine,Servo\WObj:=NoseFame;
        MoveJ Up2,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ PickSwab2,v200,fine,Servo\WObj:=FrameForSwabBox;
        g_GripIn;
        MoveJ Up2,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ OutsideNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ InNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ OutsideNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ SwabAbovePipe,v200,fine,Servo\WObj:=MixingFrame;
        MoveJ SwabInPipe,v200,fine,Servo\WObj:=MixingFrame;
        WaitDI di_StopMixing0, 1;
        MoveJ Up2,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ PickSwab2,v200,fine,Servo\WObj:=FrameForSwabBox;
        g_GripOut;
        MoveAbsJ Home,v200,fine,Servo\WObj:=NoseFame;
    ENDPROC
    PROC Test3()
        MoveAbsJ Home,v200,fine,Servo\WObj:=NoseFame;
        MoveJ Up3,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ PickSwab3,v200,fine,Servo\WObj:=FrameForSwabBox;
        g_GripIn;
        MoveJ Up3,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ OutsideNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ InNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ OutsideNose,v200,fine,Servo\WObj:=NoseFame;
        MoveJ SwabAbovePipe,v200,fine,Servo\WObj:=MixingFrame;
        MoveJ SwabInPipe,v200,fine,Servo\WObj:=MixingFrame;
        WaitDI di_StopMixing0, 1;
        MoveJ Up3,v200,fine,Servo\WObj:=FrameForSwabBox;
        MoveJ PickSwab3,v200,fine,Servo\WObj:=FrameForSwabBox;
        g_GripOut;
        MoveAbsJ Home,v200,fine,Servo\WObj:=NoseFame;
    ENDPROC
ENDMODULE

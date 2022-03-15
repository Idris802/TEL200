MODULE Module1
   
        CONST robtarget Home:=[[89.387946423,156.622117957,147.913470217],[0.066010726,0.842420918,-0.111214912,0.523068661],[0,0,0,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget AboveButton:=[[0,0,-90],[1,0,0,0],[-1,2,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Push:=[[0,0,-60],[1,0,0,0],[-1,2,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Push_2:=[[0,0,-40],[1,0,0,0],[-1,2,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Rotate:=[[0,0,-40],[0.939692621,0,0,0.342020143],[-1,2,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
PROC Main()
    IF g_IsCalibrated() THEN
            g_Init;
        ELSE
           g_Init \Calibrate, \Grip;
        ENDIF
    WaitDI di_EmergencySituation, 1;
        PushButton;
    WaitDI di_EmergencySituation, 0;
        ResetButton;
    ENDPROC
    PROC PushButton()
        MotionSup \Off;
        g_JogIn;
        MoveJ Home,v200,fine,Servo\WObj:=wobj0;
        MoveJ AboveButton,v200,fine,Servo\WObj:=Workobject_1;
        MoveJ Push,v200,fine,Servo\WObj:=Workobject_1;
        MoveJ AboveButton,v200,fine,Servo\WObj:=Workobject_1;
        MoveJ Home,v200,fine,Servo\WObj:=wobj0;
        MotionSup \On;
    ENDPROC
    PROC ResetButton()
        MotionSup \Off;
        g_JogIn;
        MoveJ Home,v200,fine,Servo\WObj:=wobj0;
        MoveJ AboveButton,v200,fine,Servo\WObj:=Workobject_1;
        g_JogOut;
        MoveJ Push_2,v200,fine,Servo\WObj:=Workobject_1;
        g_GripIn;
        MoveJ Rotate,v200,fine,Servo\WObj:=Workobject_1;
        g_JogOut;
        WaitTime 1;
        MoveJ Push_2,v200,fine,Servo\WObj:=Workobject_1;
        MoveJ AboveButton,v200,fine,Servo\WObj:=Workobject_1;
        MoveJ Home,v200,fine,Servo\WObj:=wobj0;
        MotionSup \On;
    ENDPROC
ENDMODULE

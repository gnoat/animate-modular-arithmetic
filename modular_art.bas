Let sw = 920 ' screen width
Let sh = 920 ' screen height
Screen _NewImage(sw, sh, 256)
Let background = 15 ' set background color
Paint (1, 1), background
Let resolution = 1500 ' number of integers projected onto circle
Let size = 400 ' pixel radius of circle
Let x_offset = Int(sw / 2) ' x origin
Let y_offset = Int(sh / 2) ' y origin
Let mod_size = resolution ' can set custom modulo size for arithmetic operations
Let b_size = 15 ' thickness of border circle
Let b_color = 4 ' color of border circle
Let l_color = 12 ' color of inner lines
Let fill_mult = 5 ' how densely to
Let v_max = 500 ' maximum number to perform modulo multiplication to
Let v_steps = 0.05 ' increment to increase for each frame
Let fps = 60 ' fps limit, 30 is good for viewing in program but 0 is better if creating gif of animation

For r = size - 0.5 * b_size To size + 0.5 * b_size Step 1 / (fill_mult)
    Circle (x_offset, y_offset), r, b_color
Next r
_Display
Sleep 1

For mod_mult = v_steps To v_max Step v_steps
    If fps > 0 Then
        _Limit fps
    End If
    Cls
    Paint (1, 1), background
    art (mod_mult)
    _Display
Next mod_mult

Sub art (v)
    Shared resolution
    Shared size
    Shared x_offset
    Shared y_offset
    Shared mode_size
    Shared b_size
    Shared b_color
    Shared l_color
    Shared fill_mult
    For I = 0 To resolution
        Let rad = 2 * 3.1415 * I / resolution
        Let trans_rad = 2 * 3.1415 * (I * v) / resolution ' modify this line to change the function being plotted - in this case, it's simple multiplication
        Line (trans_x(size, rad, x_offset), trans_y(size, rad, y_offset))-(trans_x(size, trans_rad, x_offset), trans_y(size, trans_rad, y_offset)), l_color
    Next I

    For r = size - 0.5 * b_size To size + 0.5 * b_size Step 1 / (fill_mult)
        Circle (x_offset, y_offset), r, b_color
    Next r
End Sub

Function trans_x (s, r, o)
    trans_x = s * Cos(r) + o
End Function

Function trans_y (s, r, o)
    trans_y = s * Sin(r) + o
End Function


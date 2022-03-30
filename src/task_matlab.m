clear;
clc;
x=[ -1 1 1 -1 -1 -1;
    1 1 -1 -1 1 1;
    1 1 -1 -1 1 1;
    -1 1 1 -1 -1 -1];
y=[ -1 -1 1 1 -1 -1;
    -1 1 1 -1 -1 -1;
    -1 1 1 -1 1 1;
    -1 -1 1 1 1 1];
z=[ -1 -1 -1 -1 -1 1;
    -1 -1 -1 -1 -1 1;
    1 1 1 1 -1 1;
    1 1 1 1 -1 1];

pic = patch(x,y,z,'r');  
% 此种patch函数格式，按照面来填充。每个面按点来叙述的. X坐标面是按照列实现，
% 每个面按照逆时针旋转记录，最后一个面要格外注意记录方式。
view(3)
axis([-3 3 -3 3 -3 3]);
grid on;
%%
delete(pic);
T = trotx(pi/4);
for i = 1 : 1 : 4
    for j = 1 : 1 : 6
        a = [x((i-1) * 6 + j), y((i-1) * 6 + j), z((i-1) * 6 + j), 1];
        a = T * a';
        x((i-1) * 6 + j) = a(1);
        y((i-1) * 6 + j) = a(2);
        z((i-1) * 6 + j) = a(3);
    end
end

pic = patch(x,y,z,'r');  
view(3)
axis([-3 3 -3 3 -3 3]);
grid on;
%%
delete(pic);
step = 50;      %旋转角度步长
dtheta = pi/4/step;  %预设绕每个轴旋转pi/4
for k = 1 : 1 : step
    T = trotx(0 + k * dtheta);
    delete(pic);
    for i = 1 : 1 : 4
        for j = 1 : 1 : 6
            a = [x((i-1) * 6 + j), y((i-1) * 6 + j), z((i-1) * 6 + j), 1];
            a = T * a';
            x((i-1) * 6 + j) = a(1);
            y((i-1) * 6 + j) = a(2);
            z((i-1) * 6 + j) = a(3);
        end
    end
    pic = patch(x,y,z,'r');
    view(3)
    axis([-3 3 -3 3 -3 3]);
    grid on;
    pause(0.5);
end

for k = 1 : 1 : step
    T = troty(0 + k * dtheta);
    delete(pic);
    for i = 1 : 1 : 4
        for j = 1 : 1 : 6
            a = [x((i-1) * 6 + j), y((i-1) * 6 + j), z((i-1) * 6 + j), 1];
            a = T * a';
            x((i-1) * 6 + j) = a(1);
            y((i-1) * 6 + j) = a(2);
            z((i-1) * 6 + j) = a(3);
        end
    end
    pic = patch(x,y,z,'r');
    view(3)
    axis([-3 3 -3 3 -3 3]);
    grid on;
    pause(0.5);
end

for k = 1 : 1 : step
    T = trotz(0 + k * dtheta);
    delete(pic);
    for i = 1 : 1 : 4
        for j = 1 : 1 : 6
            a = [x((i-1) * 6 + j), y((i-1) * 6 + j), z((i-1) * 6 + j), 1];
            a = T * a';
            x((i-1) * 6 + j) = a(1);
            y((i-1) * 6 + j) = a(2);
            z((i-1) * 6 + j) = a(3);
        end
    end
    pic = patch(x,y,z,'r');
    view(3)
    axis([-3 3 -3 3 -3 3]);
    grid on;
    pause(0.5);
end
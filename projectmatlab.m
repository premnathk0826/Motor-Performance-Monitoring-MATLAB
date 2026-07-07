%motor details
format loose
rated_current=input("enter the rated current:");
rated_voltage=input("enter the rated voltage:");
rated_power=input("enter the rated power:");
rated_speed=input("enter the rated speed RPM:");
rated_temperature=input("enter the rated temperature:");
no_of_sensor_value=input("enter the number of sensor inputs:");
hours_of_working=input("enter working hours:");
time=linspace(0,hours_of_working,no_of_sensor_value)


%sensor reading
current_sensor=rated_current+2*randn(1,no_of_sensor_value)
voltage_sensor=rated_voltage+3*randn(1,no_of_sensor_value)
temperature_sensor=rated_temperature+2*randn(1,no_of_sensor_value)
speed_sensor=rated_speed+2*randn(1,no_of_sensor_value)

%average values
avg_current=mean(current_sensor);
avg_voltage=mean(voltage_sensor);
avg_temperature=mean(temperature_sensor);
avg_speed=mean(speed_sensor);
power=avg_voltage*avg_current;
fprintf("avg current=%.2f\n",avg_current);
fprintf("avg voltage=%.2f\n",avg_voltage);
fprintf("avg temperature=%.2f\n",avg_temperature);
fprintf("avg speed=%.2f\n",avg_speed);
fprintf("Power = %.2f\n", power);

%fault notification
if(avg_current>rated_current)
    disp("overcurrent fault")
end
if(avg_voltage>rated_voltage)
    disp("overvoltage")
end
if(avg_temperature>rated_temperature)
    disp("temperature limit is exceeded")
end
if(avg_speed>rated_speed)
    disp("overspeed fault")
end
if(power>rated_power)
    disp("over power")
end
if(avg_voltage < 0.9*rated_voltage)
    disp("Undervoltage Fault")
end
if(avg_current<rated_current&&avg_voltage<rated_voltage&&avg_temperature<rated_temperature&&...
        power<rated_power&&avg_speed<rated_speed)
    disp("motor performance is good")
end

%max and min values
max_current=max(current_sensor);
min_current=min(current_sensor);
max_voltage=max(voltage_sensor);
min_voltage=min(voltage_sensor);
max_temperature=max(temperature_sensor);
min_temperature=min(temperature_sensor);
max_speed=max(speed_sensor);
min_speed=min(speed_sensor);
fprintf("max current=%.2f\n",max_current)
fprintf("min current=%.2f\n",min_current)
fprintf("max voltage=%.2f\n",max_voltage)
fprintf("min voltage=%.2f\n",min_voltage)
fprintf("max temperature=%.2f\n",max_temperature)
fprintf("mintemperature=%.2f\n",min_temperature)
fprintf("max speed=%.2f\n",max_speed)
fprintf("min speed=%.2f\n",min_speed)

%ploting of the various values
subplot(2,2,1)
grid on
plot(time,current_sensor,'-ro','LineWidth',2,'markersize',4,'markerfacecolor','b')
title('CURRENT')
xlabel('time')
ylabel('current','rotation',90)

subplot(2,2,2)
grid on
plot(time,voltage_sensor,'-go','LineWidth',2,'markersize',4,'markerfacecolor','b')
title('VOLTAGE')
xlabel('time')
ylabel('voltage','rotation',90)

subplot(2,2,3)
grid on
plot(time,temperature_sensor,'-bo','LineWidth',2,'markersize',4,'markerfacecolor','b')
title('TEMPERATURE')
xlabel('time')
ylabel('temperature','rotation',90)

subplot(2,2,4)
grid on
plot(time,speed_sensor,'-mo','LineWidth',2,'markersize',4,'markerfacecolor','b')
title('SPEED')
xlabel('time')
ylabel('speed','rotation',90)





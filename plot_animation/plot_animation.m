% close all figures
close all;

% generate time array, sine wave, and figure
t = linspace(0, 10, 1000);
x = sin(t);
figure(1);

% Initialize video
myVideo = VideoWriter('myVideoFile');
myVideo.FrameRate = 100;
open(myVideo)

% plot sine wave every 0.01 second
for i = 1:length(t)
    plot(t(i), x(i), '.b');
    ylim([-1.5, 1.5]);
    xlim([0, 10]);
    hold on;
    title('$Sine$ $Wave$', 'Interpreter', 'latex');
    ylabel('$x$', 'Interpreter', 'latex', 'rotation', 0);
    xlabel('$Time(sec)$', 'Interpreter', 'latex');
    pause(0.01)
    
    frame = getframe(gcf);
    writeVideo(myVideo, frame);
end

close(myVideo)
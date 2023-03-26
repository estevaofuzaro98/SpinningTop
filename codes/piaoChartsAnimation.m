% Dinâmica dos Sistemas Mecânicos
% Trabalho 1 - Pião Simétrico com Ponto Fixo
% 1° Semestre de 2023
% Docente: Samuel da Silva
% Discente: Estevão Fuzaro de Almeida

clear all; close all; clc;
load("dataPiao.mat")

set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultTextInterpreter','latex');
fname = ['D:\Documents\Universidade Estadual Paulista\DOUTORADO\' ...
    '2023-1\Dinamica dos Sistemas Mecanicos\TRABALHOS POS GRADUACAO\' ...
    'Trabalho 1\figures'];
txtsize = 25;
linesize = 2;
lgndsize = 15;

%% Plotando os gráficos referentes as trajetórias do Pião.
fig = figure; fig.WindowState = 'maximized';
hold on
plot3([0 x_t],[0 y_t],[0 z_t],'b',x_t,y_t,z_t,'r',0,0,0,'og',...
    'MarkerFaceColor','g','MarkerEdgeColor','k','LineWidth',linesize)
plot3([0 0],[0 0],[0 max(z_t)],'LineStyle','--','Color',[0.5 0.5 0.5],...
    'LineWidth',1)
grid on, grid minor
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k',...
    'GridColor','k')
legend('$l$ [mm]','Trajeto de A','Ponto O','Position',...
    [0.75 0.45 0.17 0.07],'fontsize',lgndsize)
title(option,'FontWeight','normal');
xlabel('$x~\textrm{[mm]}$')
ylabel('$y~\textrm{[mm]}$')
zlabel('$z~\textrm{[mm]}$')
xlim([-1.1*max(x_t) 1.1*max(x_t)])
ylim([-1.1*max(y_t) 1.1*max(y_t)])
zlim([0 1.1*max(z_t)])
% axis equal
view([-39.0 16.5])
filename = [option,' Linha'];
saveas(fig, fullfile(fname, filename), 'epsc');
saveas(fig, fullfile(fname, filename), 'png');
close(fig)

fig = figure; fig.WindowState = 'maximized';
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k',...
    'GridColor','k')
xlabel('$x~\textrm{[mm]}$')
ylabel('$y~\textrm{[mm]}$')
zlabel('$z~\textrm{[mm]}$')
xlim([-1.1*max(x_t) 1.1*max(x_t)])
ylim([-1.1*max(y_t) 1.1*max(y_t)])
zlim([0 1.1*max(z_t)])
view([-39.0 16.5])
grid on
grid minor
ptA_An = animatedline('MaximumNumPoints',100,'Color','r','LineWidth',...
    linesize);
ptO_An = animatedline('Color','g','LineStyle','none','Marker','o',...
    'MarkerSize',5,'MarkerFaceColor','g','MarkerEdgeColor','k');
l_An = animatedline('MaximumNumPoints',2,'Color','b','LineWidth',linesize);
ax_An = animatedline('MaximumNumPoints',2,'Color',[0.5 0.5 0.5],...
    'LineWidth',1,'LineStyle','--');
legend('Trajeto de A','Ponto O','$l$ [mm]','Position',...
    [0.75 0.45 0.17 0.07],'fontsize',lgndsize)
vidname = strcat('videos/',option,' Linha.mp4');
vidfile = VideoWriter(vidname, 'MPEG-4');
vidfile.FrameRate = 60;
open(vidfile)
for ii = 1:1:length(t)
    title([option,' - $t = ',num2str(t(ii),'%.3f'),' s$'],...
        'FontWeight','normal');
    addpoints(ptA_An,x_t(ii),y_t(ii),z_t(ii))
    addpoints(ptO_An,0,0,0)
    addpoints(l_An,[0 x_t(ii)],[0 y_t(ii)],[0 z_t(ii)])
    addpoints(ax_An,[0 0],[0 0],[0 max(z_t)])
    drawnow
    writeVideo(vidfile,getframe(gcf));
end
close(vidfile)
close(fig)

fig = figure; fig.WindowState = 'maximized';
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 0.8 1]);
subplot(3,1,1)
plot(t,x_t,'-k','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$x~\textrm{[mm]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

subplot(3,1,2)
plot(t,y_t,'-r','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$y~\textrm{[mm]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

subplot(3,1,3)
plot(t,z_t,'-b','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$z~\textrm{[mm]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

filename = [option,' XYZ'];
saveas(fig, fullfile(fname, filename), 'epsc');
saveas(fig, fullfile(fname, filename), 'png');
close(fig)

fig = figure; fig.WindowState = 'maximized';
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 0.8 1]);
subplot(3,1,1)
plot(t,theta_t,'-k','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$\theta~\textrm{[rad]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

subplot(3,1,2)
plot(t,psi_t,'-r','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$\psi~\textrm{[rad]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

subplot(3,1,3)
plot(t,phi_t,'-b','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$\phi~\textrm{[rad]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

filename = [option,' Angulos'];
saveas(fig, fullfile(fname, filename), 'epsc');
saveas(fig, fullfile(fname, filename), 'png');
close(fig)

fig = figure; fig.WindowState = 'maximized';
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 0.8 1]);
subplot(3,1,1)
plot(t,theta_d_t,'-k','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$\dot{\theta}~\textrm{[rad/s]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

subplot(3,1,2)
plot(t,psi_d_t,'-r','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$\dot{\psi}~\textrm{[rad/s]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

subplot(3,1,3)
plot(t,phi_d_t,'-b','LineWidth',linesize)
xlabel('$t~\textrm{[s]}$')
ylabel('$$\dot{\phi}~\textrm{[rad/s]}$$')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','GridColor','k')
hold on, grid on, grid minor

filename = [option,' VelAng'];
saveas(fig, fullfile(fname, filename), 'epsc');
saveas(fig, fullfile(fname, filename), 'png');
close(fig)

%% Animação do Pião em 3D.
clear all; close all; clc;
load("dataPiao.mat")

switch option
    case {'Piao Classico v1', 'Piao Classico v2'}
        piao = stlread("SpinningTopSTLs\PiaoClassicoMod.STL");...
            % Leitura do arquivo STL do Pião

        figure('Position',[10 10 1000 1000])    % Cria a figura
        hold on
        to = hgtransform;   % Criar um objeto transformável
        piaoMalha = trimesh(piao,'FaceColor',[0.5 0.5 0.5],...
            'EdgeColor','none','Parent',to);

        T2 = makehgtform('xrotate',0);  % Transladar e Rotacionar
                                        % para alinhar com +Z
        T1 = makehgtform('translate',[-mean(piao.Points(:,1))...
            -mean(piao.Points(:,2)) -min(piao.Points(:,3))]);
        TCorrective = T2*T1;    % Transformação Homogênea que centraliza
                            % o topo e o flipa para a orientação correta

        axis([-40 40 -40 40 -15 75])

    case 'Piao Saia'
        piao = stlread("SpinningTopSTLs\PiaoSaiaMod.stl"); % Leitura 
                                            % do arquivo STL do Pião

        figure('Position',[10 10 1000 1000])    % Cria a figura
        hold on
        to = hgtransform;   % Criar um objeto transformável
        piaoMalha = trimesh(piao,'FaceColor',[0.5 0.5 0.5],...
            'EdgeColor','none','Parent',to);

        T2 = makehgtform('xrotate',0);  % Transladar e Rotacionar
                                        % para alinhar com +Z
        T1 = makehgtform('translate',[-mean(piao.Points(:,1))...
            -mean(piao.Points(:,2)) -min(piao.Points(:,3))]);
        TCorrective = T2*T1;    % Transformação Homogênea que 
                                % centraliza o topo e o flipa
                                % para a orientação correta

        axis([-40 40 -40 40 -15 58])

    case 'Piao Totem'
        piao = stlread("SpinningTopSTLs\PiaoTotem.stl"); % Leitura do 
                                                % arquivo STL do Pião

        figure('Position',[10 10 1000 1000])    % Cria a figura
        hold on
        to = hgtransform;   % Criar um objeto transformável
        piaoMalha = trimesh(piao,'FaceColor',[0.5 0.5 0.5],'EdgeColor',...
            'none','Parent',to);

        T2 = makehgtform('xrotate',0); % Transladar e Rotacionar
                                       % para alinhar com +Z
        T1 = makehgtform('translate',[0 0 -min(piao.Points(:,3))]);
        TCorrective = T2*T1;    % Transformação Homogênea que centraliza
                            % o topo e o flipa para a orientação correta

        axis([-33 33 -33 33 -10 38])
end
view(3)
set(gca,'Color',[0 0 0],'xtick',[],'ytick',[],'ztick',[],'Position',...
    [-0.3 -0.3 1.6 1.6],'YDir','reverse')
grid on
pbaspect([1 1 1])
daspect([1 1 1])
piaoMalha.FaceLighting = 'gouraud';   % Luz realista
camlight('headlight');
material('shiny');
% Coordenadas 3D de um ponto localizado acima da ponta do topo
piaoTopo = [0 0 1.01*(max(piao.Points(:,3))-min(piao.Points(:,3)))]';
piaoCoord = [];                                                         
vidname = strcat('videos/',option,' 3D.mp4');
vidfile = VideoWriter(vidname, 'MPEG-4');
vidfile.FrameRate = 60;
vidfile.Quality = 10;
open(vidfile)
piaoCoordAn = [];
for ii = 1:1:length(t)
    % Rotação do topo
    R = makehgtform('zrotate',phi_t(1,ii),'xrotate',theta_t(1,ii),...
        'zrotate',psi_t(1,ii));
    DCM = angle2dcm(-psi_t(1,ii),-theta_t(1,ii),-phi_t(1,ii),'ZXZ'); 
    to.Matrix = R*TCorrective;
    % Guardar coordenada do topo
    piaoCoord = [piaoCoord DCM*piaoTopo]; %#ok<AGROW> 
    % Plota coordenada do topo
    topoTraceAn = animatedline('MaximumNumPoints',100,'Color',...
        [1 1 1 0.5],'LineWidth',1.5);
    addpoints(topoTraceAn,piaoCoord(1,:),piaoCoord(2,:),piaoCoord(3,:))
    % Escrever frame pra um vídeo
    writeVideo(vidfile,getframe(gcf));
end
% Fecha o arquivo de vídeo
close(vidfile)
close

load handel
sound(y,1.2*Fs)

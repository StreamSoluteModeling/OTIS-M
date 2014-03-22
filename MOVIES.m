%!**********************************************************************
%
%     Subroutine MOVIES             Called by: OUTPUT
%
%     Create Movies of the Solute Simulation
%
%***********************************************************************
%
%
cd(CF);
for Sol = 1:NSOLUTE
    fig=figure;
    set(fig,'DoubleBuffer','on');
    set(gca,'xlim',[-80 80],'ylim',[-80 80],'nextplot','replace','Visible','off')
    %Create Simulation of all Zones
    MOVIENAME = strcat(NAMESOL(Sol,:),'_Simulation.avi');
    aviobj = avifile(MOVIENAME,'fps',6);
    MC = load(strcat(NAMESOL(Sol,:),'_MC_Solute.txt'));
    STS = load(strcat(NAMESOL(Sol,:),'_STS_Solute.txt'));
    HTS = load(strcat(NAMESOL(Sol,:),'_HTS_Solute.txt'));
    SZ = size(MC);
    for I = 2:SZ(1);
        h = plot(MC(1,2:SZ(2)),MC(I,2:SZ(2)), 'g');
        hold on;
        if max(max(STS(2:SZ(1),2:SZ(2)))) > 0
            h = plot(STS(1,2:SZ(2)),STS(I,2:SZ(2)), 'b');
            hold on;
            LEGEND = strvcat('Main Channel','STS');
        end
        if max(max(HTS(2:SZ(1),2:SZ(2)))) > 0
            h = plot(HTS(1,2:SZ(2)),HTS(I,2:SZ(2)), 'r');
            LEGEND = strvcat(LEGEND,'HTS');
        end
        hold off;
        axis ([MC(1,2) MC(1,SZ(2)) 0 max(max(MC(2:SZ(1),2:SZ(2)))) ]);
        TIME = strrep(strcat('Solute Simulation @ t =:',num2str(MC(I,1),'%10.3e'),':hr'),':',' ');
        legend(LEGEND);
        xlabel(strcat('Distance (',LU,')'));
        ylabel(strcat('Concentration (',CU(Sol,:),')'));
        if INEST == 1
            title({TITLE;'Nested Model Structure';TIME});
        else
            title({TITLE;'Competing Model Structure';TIME});
        end;
        set(h,'EraseMode','xor');
        frame = getframe(gcf);
        aviobj = addframe(aviobj,frame);
    end
    aviobj = close(aviobj);
end;
cd(WF);
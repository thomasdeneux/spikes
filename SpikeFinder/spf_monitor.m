function tim = spf_monitor
% function spf_monitor
%---
% Monitor current jobs

tim = timer('TimerFcn',@monitor,'Period',60,'ExecutionMode','FixedSpacing');
start(tim)
if nargout==0
    assignin('base','tim',tim)
    disp 'Timer ''tim'' has been created in base workspace and started.'
    clear tim
end

% monitor

%---
function monitor(~,~)

%%
try
    x = spf_summary;
catch ME
    disp(ME.message)
    return
end
dsave = spf_folders('precomp');

yrange = .03;

brick.figure('SPF MONITOR','nofocus','noerase')
for datanum = 1:10
    subplot(2,5,datanum)
    dataflag = brick.switch_case(datanum,2,92,datanum);
    res = [x([x.datanum] == datanum).res];
    n = length(res);
    if n==0, continue, end
    hall = zeros(1,n);
    [~, ord] = sortrows([res.running; res.score]'); % finish with running one(s), to have it(them) on top
    for i=brick.row(ord)
        resi = res(i);
        if resi.running
            fsave = fullfile(dsave,sprintf('%s-dataset%i.mat',resi.method,dataflag));
            resi = brick.loadvar(fsave,'res');
            score = [resi.score];
            plot(score,'color',brick.colorset('newmatlab',i)/2+1/2)
            hold on
            hall(i) = plot(cummax(score),'color',brick.colorset('newmatlab',i),'linewidth',3);
        else
            hall(i) = plot([1 2],resi.score*[1 1],'color',brick.colorset('newmatlab',i));
        end
        hold on
    end
    hold off
    set(gca,'ylim',max([res.score])+[-1 .1]*yrange)
    set(hall(~[res.running]),'xdata',get(gca,'xlim'))
    title(sprintf('Dataset %i',datanum),'fontweight',brick.switch_case(any([res.running]),'bold','normal'))
    legend(hall,{res.method},'location','SouthEast')
end

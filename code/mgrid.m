% visualizing paths on a manhattan grid

NSmin=0;NSmax=32;EWmin=0;EWmax=12;

figure(1)
clf
hold on
box on
axis equal
axis([EWmin-1 EWmax+1 NSmin-1 NSmax+1])
xlabel('East West');
ylabel('North South');

for ns=NSmin:NSmax
    for ew=EWmin:EWmax
        plot(2.9*ew,ns,'b.')
    end
end

nlength=NSmax-NSmin;
elength=EWmax-EWmin;
plength=nlength+elength;
allpaths=[];

stepthresh=elength/(elength+nlength);

for pathcount=1:100
    nsteps=0;esteps=0;npaths=0;
    newpath=[];

    for pstep=1:plength
        nextstep=rand;
        if nextstep<stepthresh && esteps<elength
            newpath(pstep)=0;
            esteps=esteps+1;
        elseif nsteps<nlength
            newpath(pstep)=1;
            nsteps=nsteps+1;
            totsteps=totsteps+1;
        elseif nextstep>=stepthresh && nsteps<nlength
            newpath(pstep)=1;
            nsteps=nsteps+1;
        elseif esteps<elength
            newpath(pstep)=0;
            esteps=esteps+1;
        else
            disp([esteps nsteps "Error 2!"]);
        end
    end
    
    
    xpos=EWmin;ypos=NSmin;

    for pathplot=1:plength
        if newpath(pathplot)==0
            plot([xpos xpos+2.9],[ypos ypos],'r-');
            xpos=xpos+2.9+0.05*randn;
        else
            plot([xpos xpos],[ypos,ypos+1],'r-');
            ypos=ypos+1+0.05*randn;
        end
    end
    allpaths=[allpaths;newpath];
end

    
        
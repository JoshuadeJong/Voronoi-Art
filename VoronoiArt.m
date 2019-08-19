function [X] = VoronoiArt(ImageName, Resolution, Alpha)

% Find Image and Read In
fullFileName = FindFile(ImageName);
Image = imread(fullFileName);

% Find Size of Image and create random points to sample image
[Height, Width, ~] = size(Image);
PointAmount = Height*Width/Resolution;
Points = [randi(Height, PointAmount, 1), randi(Width, PointAmount, 1)];

% Border
Bound = 20;
ResMult = 3;
detx = (Width+2*Bound)/(ResMult*Resolution);
dety = (Height+2*Bound)/(ResMult*Resolution);
for i = 0:ResMult*Resolution
    Points(end+1,:) = [-Bound, i*detx-Bound];
    Points(end+2,:) = [Height+Bound, i*detx-Bound];
    Points(end+3,:) = [i*dety-Bound , -Bound];
    Points(end+4,:) = [i*dety-Bound, Width+Bound];
end

Points = unique(Points, 'rows');

    
% Create the voronoi of points
[v,c] = voronoin(Points);

% Create backgound aimge
figure('WindowState', 'fullscreen', ...
       'MenuBar', 'none', ...
       'ToolBar', 'none')
hFig = gcf;
hAx  = gca;
set(hFig,'units','normalized','outerposition',[0 0 1 1]);
set(hAx,'Unit','normalized','Position',[0 0 1 1]);
set(hFig,'menubar','none')
set(hFig,'NumberTitle','off');

for i = 1:length(c)
    if all(c{i}~=1)
        x = v(c{i}, 1);
        y = v(c{i}, 2);

        Polyin = polyshape(x,y);
        [Hight_P, Width_P] = centroid(Polyin);
        
        Hight_P = floor(Hight_P);
        Width_P = floor(Width_P);
        
        if Hight_P < 1
           Hight_P = 2; 
        elseif Hight_P > Height
           Hight_P = Height-1;
        end
        
        if Width_P < 1
           Width_P = 2; 
        elseif Width_P > Width
            Width_P = Width-1;
        end
        
        Color = Image(Hight_P, Width_P, :);

        patch(y, -x, Color, 'FaceAlpha', Alpha, 'EdgeColor', 'none')
    end
end


axis off
xlim([1 Width])
ylim([-Height -1])

F = getframe(gcf);
[X, Map] = frame2im(F);
close all

imwrite(X, [ImageName(1:end-4) '_Final.png'])

end

function [fullFileName] = FindFile(FileName)

    baseFileName = FileName;
    folder = fileparts(which(baseFileName)); % Determine where the folder is
    fullFileName = fullfile(folder, baseFileName);

    if ~exist(fullFileName, 'file')
        % It doesn't exist in the current folder.
        % look on the search path.
        if ~exist(baseFileName, 'file')
            % If doesn't exist on the search path either.
            % Alert user that file can't be found
            title = 'ColorSpec - File Error';
            warningMessage = sprintf('Error: the input file\n%s\n was not found. Click OK to exit.', fullFileName);
            uiwait(warndlg(warningMessage, title));
            fprintf(1, 'Finished running ColorSpec.m\n');
            return;
        end
        fullFileName = baseFileName;
    end
end

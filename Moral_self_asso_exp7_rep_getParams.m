function params = Moral_self_asso_exp7_rep_getParams(subID)

% function params = getParams
% 
% This function makes the struct that holds th parameters for the
% presentation of the stimuli and such.
%
% progammer         Date               History of reivision
% ==========      ===================  =====================
% Hcp             2012/12/29            original code
% hcp             2016/05/29            adjust for categorization task, not
%                                       finished
% hcp             2016/06/19            adjust for new balance design
% hcp             2017/12/17            modified to repliation of exp7
% hcp             2018/01/03            changed the matrix for new design

%% define the useful directory in this experiment
params.rootDir = pwd;
params.stimDir = [params.rootDir '\stimuli\'];  % the same set of stimuli were used.
params.dataDir = [params.rootDir '\data\'];

%% Set the experimental conditions
% make counterbalance matrix
% balance the relationship between shape and label 
% 12 elements * 6 repetition = 72 conditions  
balanceMatrix.moralSelf    = repmat({'C',  'S',  'P',  'Tra','H',  'D',  'C',  'S',  'P',  'Tra','H',  'D'  },[1,6]);
balanceMatrix.neutralSelf  = repmat({'S',  'P',  'Tra','H',  'D',  'C',  'S',  'P',  'Tra','H',  'D',  'C'  },[1,6]);
balanceMatrix.immoralSelf  = repmat({'P',  'Tra','H',  'D',  'C',  'S',  'P',  'Tra','H',  'D',  'C',  'S'  },[1,6]);
balanceMatrix.moralOther   = repmat({'Tra','H',  'D',  'C',  'S',  'P',  'Tra','H',  'D',  'C',  'S',  'P'  },[1,6]);
balanceMatrix.neutralOther = repmat({'H',  'D',  'C',  'S',  'P',  'Tra','H',  'D',  'C',  'S',  'P',  'Tra'},[1,6]);
balanceMatrix.immoralOther = repmat({'D',  'C',  'S',  'P',  'Tra','H',  'D',  'C',  'S',  'P',  'Tra','H'  },[1,6]);

% balance responding keys
% 12 elements * 6 repetition = 72 conditions
balanceMatrix.matchResp      = repmat({'N','N','N','N','N','N','M','M','M','M','M','M'},[1,6]);  % response for "match" trials in match tasks
balanceMatrix.mismatchResp   = repmat({'M','M','M','M','M','M','N','N','N','N','N','N'},[1,6]);  % response for "mismatch" trials in match tasks
balanceMatrix.selfResp       = repmat({'F','F','F','J','J','J','F','F','F','J','J','J'},[1,6]);  % response for "self" trials in self-other categorization tasks
balanceMatrix.otherResp      = repmat({'J','J','J','F','F','F','J','J','J','F','F','F'},[1,6]);  % response for "other" trials in self-other categorization  in match tasks
balanceMatrix.moralResp      = repmat({'U','U','U','R','R','R','U','U','U','R','R','R'},[1,6]);  % response for "moral" trials in moral-otherwise categorization 
balanceMatrix.notmoralResp   = repmat({'R','R','R','U','U','U','R','R','R','U','U','U'},[1,6]);  % response for "moral" trials in moral-otherwise categorization 
balanceMatrix.immoralResp    = repmat({'Q','Q','Q','P','P','P','Q','Q','Q','P','P','P'},[1,6]);  % response for "immoral" trials in immoral-otherwise categorization 
balanceMatrix.notimmoralResp = repmat({'P','P','P','Q','Q','Q','P','P','P','Q','Q','Q'},[1,6]);  % response for "immoral" trials in immoral-otherwise categorization 

% balance categorization tasks
% 9 elements * 8 repetition = 72 conditions
balanceMatrix.block1 = repmat({'self',    'moral',   'immoral', 'moral',   'immoral', 'self',    'immoral', 'self',   'moral'},[1,8]);  % counterbalance the categorization task
balanceMatrix.block2 = repmat({'moral',   'immoral', 'moral',   'immoral', 'self',    'immoral', 'self',    'moral'   'self'},[1,8]);
balanceMatrix.block3 = repmat({'immoral', 'moral',   'immoral', 'self',    'immoral', 'self',    'moral'    'self',   'moral'},[1,8]);
balanceMatrix.block4 = repmat({'moral',   'immoral', 'self',    'immoral', 'self',    'moral'    'self',   'moral',   'immoral'},[1,8]);
balanceMatrix.block5 = repmat({'immoral', 'self',    'immoral', 'self',    'moral'    'self',   'moral',   'immoral',  'moral'},[1,8]);
balanceMatrix.block6 = repmat({'self',    'immoral', 'self',    'moral'    'self',   'moral',   'immoral',  'moral'    'immoral'},[1,8]);
balanceMatrix.block7 = repmat({'immoral', 'self',    'moral'    'self',   'moral',   'immoral',  'moral'    'immoral'  'self'},[1,8]);
balanceMatrix.block8 = repmat({'self',    'moral'    'self',   'moral',   'immoral',  'moral'    'immoral'  'self'     'immoral'},[1,8]);
balanceMatrix.block9 = repmat({'moral'    'self',   'moral',   'immoral',  'moral'    'immoral'  'self'     'immoral'  'self'},[1,8]);

% assign picture and response keys to current participants
subIndex = mod(subID,72) + 1;
params.moralSelfPicName   = balanceMatrix.moralSelf(subIndex); 
params.moralSelfPicName   = params.moralSelfPicName{1};    % convert cell to char
params.neutralSelfPicName = balanceMatrix.neutralSelf(subIndex); 
params.neutralSelfPicName = params.neutralSelfPicName{1};    % convert cell to char
params.immoralSelfPicName = balanceMatrix.immoralSelf(subIndex);
params.immoralSelfPicName = params.immoralSelfPicName{1};

params.moralOtherPicName   = balanceMatrix.moralOther(subIndex);
params.moralOtherPicName   = params.moralOtherPicName{1};
params.neutralOtherPicName = balanceMatrix.neutralOther(subIndex);
params.neutralOtherPicName = params.neutralOtherPicName{1};
params.immoralOtherPicName = balanceMatrix.immoralOther(subIndex);
params.immoralOtherPicName = params.immoralOtherPicName{1};

KbName('UnifyKeyNames');
params.matchResponKey      = KbName(balanceMatrix.matchResp(subIndex));      % match
params.mismatchResponKey   = KbName(balanceMatrix.mismatchResp(subIndex));   % non-match,other
params.selfResponKey       = KbName(balanceMatrix.selfResp(subIndex));       % self
params.otherResponKey      = KbName(balanceMatrix.otherResp(subIndex));      % other
params.moralResponKey      = KbName(balanceMatrix.moralResp(subIndex));      % moral
params.notmoralResponKey   = KbName(balanceMatrix.notmoralResp(subIndex));   % not-moral
params.immoralResponKey    = KbName(balanceMatrix.immoralResp(subIndex));    % immoral
params.notimmoralResponKey = KbName(balanceMatrix.notimmoralResp(subIndex)); % not-immoral

params.escapeKey = KbName('ESCAPE');
params.spaceKey = KbName('SPACE');

% assign block to current paricipants 
params.taskMatrix = {balanceMatrix.block1(subIndex),balanceMatrix.block2(subIndex),balanceMatrix.block3(subIndex),...
         balanceMatrix.block4(subIndex),balanceMatrix.block5(subIndex),balanceMatrix.block6(subIndex),...
         balanceMatrix.block7(subIndex),balanceMatrix.block8(subIndex),balanceMatrix.block9(subIndex)};

% Load the images corresponding to each condition
cd(params.stimDir);
params.moralSelf    = imread([params.moralSelfPicName '.bmp']);
params.neutralSelf  = imread([params.neutralSelfPicName '.bmp']);
params.immoralSelf  = imread([params.immoralSelfPicName '.bmp']);
params.moralOther   = imread([params.moralOtherPicName '.bmp']);
params.neutralOther = imread([params.neutralOtherPicName '.bmp']);
params.immoralOther = imread([params.immoralOtherPicName '.bmp']);

% load images of labels
params.labelmoralSelf    = imread(['moralSelf','.bmp']);
params.labelneutralSelf  = imread(['neutralSelf','.bmp']);
params.labelimmoralSelf  = imread(['immoralSelf','.bmp']);
params.labelmoralOther   = imread(['moralOther','.bmp']);
params.labelneutralOther = imread(['neutralOther','.bmp']);
params.labelimmoralOther = imread(['immoralOther','.bmp']);
    
% Load Intructions for each participant
params.learnInstruc            = imread(['Instruct_learn_',num2str(mod(subID,6)+1),'.jpg']);
params.learnPracInstruc        = imread(['Instruct_learn_prac_',num2str(mod(subID,6)+1),'.jpg']);
params.learnRestInstruc        = imread(['Instruct_rest_',num2str(mod(subID,6)+1),'.jpg']);
params.testInstrucSelf1        = imread('test_self_1.jpg');
params.testInstrucSelf2        = imread('test_self_2.jpg');
params.testInstrucMoral1       = imread('test_moral_1.jpg');
params.testInstrucMoral2       = imread('test_moral_2.jpg');
params.testInstrucimmoral1     = imread('test_immoral_1.jpg');
params.testInstrucimmoral2     = imread('test_immoral_2.jpg');
params.testRestInstrucSelf1    = imread('test_rest_self_1.jpg');
params.testRestInstrucSelf2    = imread('test_rest_self_2.jpg');
params.testRestInstrucMoral1   = imread('test_rest_moral_1.jpg');
params.testRestInstrucMoral2   = imread('test_rest_moral_2.jpg');
params.testRestInstrucimmoral1 = imread('test_rest_immoral_1.jpg');
params.testRestInstrucimmoral2 = imread('test_rest_immoral_2.jpg');
% pracInstruc = imread(['Instruct_condition_',num2str(mod(subID,8)+1),'.jpg']);
% restInstruc = imread(['Instruct_condition_',num2str(mod(subID,8)+1),'.jpg']);
params.feedbackCorrectImage   = imread('feed_correct.jpg');
params.feedbackIncorrectImage = imread('feed_wrong.jpg');
params.feedbackNoRespImage    = imread('feed_tooSlow.jpg');
cd(params.rootDir);

%%  ******************************* 
AssertOpenGL;
params.whichscreen = min(Screen('Screens'));     % 有的是用max，作用差不多
% ifi=Screen('GetFlipInterval',window);          % 获得刷新的时间 
% % define colors 
params.black = BlackIndex(params.whichscreen);
params.white = WhiteIndex(params.whichscreen);
params.gray = round((params.black + params.white)/2);
params.winSize = [];

% using parameters from screen
[w,rect] = Screen('OpenWindow',params.whichscreen, params.gray,params.winSize);
params.XCenter = rect(3)/2;                           %获得水平方向中心的坐标
params.YCenter = rect(4)/2;                           %获得水平方向中心的坐标

HideCursor
params.pixsPerDeg = 1366/(2*atand(34.5/2/60)); % voxel for 1 degree：Monitor.Width/(2*atand(Monitor.Width/2/ Monitor.Distance));
params.pixsPerDeg = round(params.pixsPerDeg);
params.TargetDeg  = 3.6;    % visual angle of the target shape
params.distDeg    = 3.5;    % visual angle between the center of shape and the fixation

%% parameters for presenting location of stimuli
params.shapeWidth  = round(params.TargetDeg*params.pixsPerDeg);        % the width of shape;
params.shapeLength = round(params.TargetDeg*params.pixsPerDeg);        % the length of shape;
params.shapeSize   = [0 0 params.shapeWidth params.shapeLength];       % size of shape
params.labelWidth  = round(params.TargetDeg*params.pixsPerDeg);        % the width of label
params.labelHight  = round(1.6*params.pixsPerDeg);                     % the length of label
params.labelSize   = [0 0 params.labelWidth params.labelHight];        % window for presenting target images  2012.12.25:图片大小根据现有图片进行了调整
params.offset      = round(params.distDeg*params.pixsPerDeg);          % the distance between stimuli window and middle poit of the screen

% design related variable (not used in current experiment
params.IV1 = 2;           % 自变量1，两个水平: 自我 vs. 他人
params.IV2 = 3 ;          % Independent variable 2，three levels: moral, netural, vs. immoral
params.trials4EachCond = 2;       % trials for each condition, need to get back to 60 when

% 视觉刺激位置相关参数：
% params.shapeRect = CenterRect(params.shapeSize,rect);  % define the size of the rect used for presenting stimulus
% params.shapeRect = OffsetRect (rect, 0,params.offset);   % the rect for shapee
% params.labelRect = OffsetRect (rect, 0,params.offset);   % the rect for label
% params.shapeRect2 = CenterRect(params.shapeSize, params.shapeRect);   % define the upper window for shape image
% params.labelRect2 = CenterRect(params.labelSize, params.labelRect);   % define the lower window for label image

% params.RampDur = 1;  % ramp up的时间

params.ISI         = (0.5+randsample(0:400,1)/1000);    %ISI, in seconds
params.fixDur      = 0.5 - randsample(0:100,1)/1000;    % duration of fixation for each trial
params.TargetDur   = 0.1;                               % 刺激呈现时间
params.FeedbackDur = 0.5;                               % duration for feedback in practice
params.BlankDur    = (0.8+randsample(0:300,1)/1000);    %800-1100ms随机
% params.TrialDur    = params.fixDur + params.TargetDur + params.BlankDur + params.FeedbackDur;     %trialDur也是随机数

% define parameters for the duration of each stimuli
% params.CycleFrames = 10;     % 10 帖图，后面将用在目标图片的对比在1分钟之内ramp up使用
params.fps = round( FrameRate(w));                      % 屏幕的刷新率
params.ifi = Screen('GetFlipInterval',w);
params.waitframes = round(params.fps/10) ;              % 屏幕刷新率的10分之一，与后面刺激呈现的时间相关

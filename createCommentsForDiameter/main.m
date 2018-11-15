todos={'Cell64_4skels_ck.001done.nml.zip'...
'Cell55_3skels_ck.001done.nml.zip'...
'Cell23_4skels_ck.001done.nml.zip'...
'Cell Y_3skels_ck.001done.nml.zip'... 
'Cell163_2skels_ck.001done.nml.zip'...
'Cell22_6skels_ck.001done.nml.zip'...
'cell40_4skels_ck.001done.nml.zip'...
'Cell15_8skels_ck.001unsure.002_unsure_correctedByCK_mailOf2014-03-18_redone_was_2012-06-26_C80_11__explorational__kboergens__d982b6.nml.zip'...
'Cell Z_5skels_ck.001_corrected.nml.zip'...
'Cell45_6skels_ck.001_corrected.nml.zip'...
'Cell48_5skels_ck.001_corrected.nml.zip'...
'Cell71_4skels_ck.001_corrected.nml.zip'...
'Cell19_7skels_ck.001_corrected.nml.zip'...
'cell27_merged.nml.zip'...
'cell138_merged.nml.zip'...
'Cell_VSLBD_11skels_ck001_corrected.nml.zip'...
'Cell41_3skels_ck.001_corrected.nml.zip'...
'Cell24_5skels_ck_corrected.001.nml.zip'...
'Cell65_7skels_ck.001_corrected.nml.zip'...
'Cell25_3skels_ck.001_corrected.nml.zip'...                                                                                                       
'Cell26_5skels_ck.001_corrected.nml.zip'...
'Cell75_4skels_ck.001_corrected.nml.zip'...
'Cell151_4skels_ck.001_corrected.nml.zip'...
'Cell36_4skels_ck.001_corrected.nml.zip'...
'Cell126_4skels_ck.001_corrected.nml.zip'...
'Cell153_4skels_ck.001_corrected.nml.zip'...
'CellX_7skels_ck.001_corrected.nml.zip'...
'Cell50_6skels_ck.001_corrected.nml.zip'...
'Cell2_6skels_ck.001_corrected.nml.zip'};
%first batch:
% todos={'corrected_hw_DCH_cell3_28_70_127_ck.nml.zip','Cell7_VCH_1Skel.001_oxalis_reload.nml.zip'};
 set(0,'RecursionLimit',50000)
temppath='D:\temp\'
limit=length(todos):length(todos);
for j=limit
    unzip(['merged' filesep todos{j}],temppath);
    
    addpath('skeletonClass');
    skel=skeleton([temppath todos{j}(1:end-4)],false);
    list_Sorted=skeletonSort(skel,1,1);
    for i=1:size(skel.nodes{1},1)
        if list_Sorted(i)==i
             skel.nodesAsStruct{1}{i}.comment=['comment_' num2str(i)];
            continue;
        end
        skel=skel.switchIDs(1,i,list_Sorted(i));
        skel.nodesAsStruct{1}{i}.comment=['comment_' num2str(i)];
        list_Sorted(list_Sorted==i)=list_Sorted(i); %lookup for that node
    end
    skel.parameters.activeNode.id='1';
    skel.write([temppath todos{j}(1:end-8) '_sorted.nml']);
    
    
end
for j=limit
    zip(['withcomments\' todos{j}(1:end-8) '_sorted.nml.zip'], {[temppath todos{j}(1:end-8) '_sorted.nml']})
end
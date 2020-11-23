##input files 
	#tss-2k: the regions for coverage calculation of promoter NDRs; columns are transcript name, region, and gene direction
	#sample.bam: the bam file of the sample
##output files 
	#score-NDR-cap2: mean coverage of the NDR, positions with relative coverage > 2 were truncated to reduce bias from potential outlier values
	#score-NDR: mean coverage of the NDR

line=$(wc -l tss-2k | awk '{print $1}')
> score-NDR-cap2
> score-NDR
        for((i=1;i<=$line;i=i+1))
        do
	
	sed "$i p"  -n  tss-2k > cas
	site=$(awk '{print $2}' cas)
	samtools depth -aa -r $site sample.bam > examp.depth
        sed '2001,4001p' -n examp.depth > window
        sed '1001,2000p' -n examp.depth > win-up
        sed '4002,5001p' -n examp.depth > win-down
        cat win-up win-down > base
        awk '{ total += $3 } END { print total/NR }' base > tmp
        n=$(cat tmp)
	awk -v n=$n '{if(n>0 ) print $3/n; else print "N.A."}'  window > pre-normal
	
	s=$(awk '{print $3}' cas)
	if [ "$s" == "+" ];
	then
	cp pre-normal normal
	else
	tac pre-normal  > normal
	fi
	
	awk '{if($1>2) print "2"; else print $1}' normal > normal-cap2
	sed '851,1051p' -n  normal-cap2  > ndr-cap2
	awk '{ total += $1 } END {if(total>0) print total/NR; else print "N.A."}'  ndr-cap2 > ndr-ave-cap2
	cat score-NDR-cap2 ndr-ave-cap2 > m2
	mv m2 score-NDR-cap2

	sed '851,1051p' -n normal > ndr
	awk '{ total += $1 } END {if(total>0) print total/NR; else print "N.A."}'  ndr > ndr-ave
	cat score-NDR ndr-ave > m
	mv m score-NDR

	rm case-*.sh 

        done


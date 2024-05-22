def accounting(file):
    try:
        datatransfer = open(file,'r')
    except:
        print ("Unable to open file")
    
    alldata = datatransfer.read()
    datatransfer.close
    
    alldata = alldata.strip()
    linesdata = alldata.split('\n')
    #print (linesdata)
    
    mostpay = ""
    fewdaysnames = []
    fewdays = []
    totalpay = 0
    avgpay = 0
    peoplepayments = []
    
    for aline in linesdata[1:]:
        
        parts = aline.split(',')
        #print(parts)
        
        pay = float(parts[2])
        #print(pay)
        
        newpart = [pay] + parts
        print(newpart)
        
        peoplepayments += newpart
        peoplepayments = peoplepayments.sort()
        mostpay = peoplepayments[-1][1]
        print(mostpay)
        
    
    return 1

print(accounting("sample.csv"))
        
    
    
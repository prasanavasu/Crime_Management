from django.shortcuts import render,redirect
from django.http import HttpResponse
from .models import *
from django.contrib import messages
from django.core.validators import validate_email
from django.contrib.auth.models import User,auth
import mysql.connector as p
import datetime
import time

conn = p.connect(
user = 'root',
password = 'admin',
host = 'localhost',
database = 'crimemanagement'
)

# Create your views here.
def Run_Here(request):
    return render(request,"Run_Here.html")

def publiccomplaint(request):
    return render(request,"publiccomplaint.html")

def Add_Complaint(request):
    Email= request.session['email']
    reg=register_form.objects.get(Email=Email)
    fn=reg.Name
    return render(request,"Add_Complaint.html",{'fn':fn})

def index(request):
    Email= request.session['email']
    reg=register_form.objects.get(Email=Email)
    fn=reg.Name
    return render(request,"index.html",{'fn':fn})

def criminalview(request):
    co=addcriminalls.objects.all()
    Email= request.session['email']
    reg=register_form.objects.get(Email=Email)
    fn=reg.Name
    return render(request,"criminalview.html",{'co':co,'fn':fn})


def addcriminals(request):
    bn=request.session['bnname']
    return render(request,"addcriminals.html",{'bn':bn})

def finish(request):
   
    bn = request.session['bnname']
    bnnam = request.POST.get('bnn')
    crimename = request.POST.get('cnn')
    fil=fileupload.objects.all()
    if fileupload.objects.filter(bnname=bnnam).exists():
        if fileupload.objects.filter(crimename=crimename).exists():
            inn=fileupload.objects.get(crimename=crimename)
            valu=inn.value
            mgg="completed"
            if valu=="2":   
                inn.value=str(3)
                inn.save();
    return render(request,"reqdoc.html",{'fil':fil,'bn':bn,'mgg':mgg})

def reqdoc(request):
    bn = request.session['bnname']
    bnnam = request.POST.get('bnn')
    crimename = request.POST.get('cnn')
    fil=fileupload.objects.all()
    if fileupload.objects.filter(bnname=bnnam).exists():
        if fileupload.objects.filter(crimename=crimename).exists():
            inn=fileupload.objects.get(crimename=crimename)
            valu=inn.value 
            if valu=="1":
                inn.value=str(2)
                inn.save();
    return render(request,"reqdoc.html",{'fil':fil,'bn':bn})

def reqdoc2(request):
    bn = request.session['bnname']
    return render(request,"reqdoc.html",{'bn':bn})

def acceptdoc(request):
    fil=fileupload.objects.all()
    bn = request.session['bnname']
    return render(request,"acceptdoc.html",{'fil':fil,'bn':bn})

def viewcomp(request):
    com=complaint_details.objects.all()
    bn = request.session['bnname']
    return render(request,"comp.html",{'com':com,'bn':bn})

def publiccompl(request):
    co=complaint.objects.all()
    return render(request,"viewpubliccomp.html",{'co':co})
##############################################
def upload(request):
    com=complaint_details.objects.all()
    crimename = request.POST.get('cid')
    crimearea = request.POST.get('uid')
    bnname = request.POST.get('bname')
    files = request.FILES.get('upload')
    bn=bnname
    meg="file uploaded"
    print(files)
    value=str(1)
    if fileupload.objects.filter(crimename=crimename).exists():
        fill=fileupload.objects.get(crimename=crimename)
        pid=fill.id
        fil=fileupload(id=pid,crimename=crimename,crimearea=crimearea,bnname=bnname,files=files,value=value)
    else:
        fil=fileupload(crimename=crimename,crimearea=crimearea,bnname=bnname,files=files,value=value)
    fil.save();
    return render(request,"comp.html",{'meg':meg,'com':com,'bn':bn})

def viewcomp2(request):
    bn=request.session['bnname']
    Email = request.POST.get('email')
    com=area.objects.filter(Email=Email)
    comm=register_form.objects.get(Email=Email)
    name=comm.Name
    coo=complaint_details.objects.get(Email=Email)
    img=coo.image
    fn=coo.firstname
    ln=coo.lastname
    are=coo.carea
    wip=coo.wip

    print(com)
    return render(request,"comp2.html",{'com':com,'name':name,'img':img,'fn':fn,'ln':ln,'are':are,'wip':wip,'bn':bn})

def Complaintstatus(request):
    Email= request.session['email']
    reg=register_form.objects.get(Email=Email)
    fn=reg.Name
    comp=complaint_details.objects.all()
    com=complaint_details.objects.get(Email=Email)
    carea=com.carea
    crna=com.cname
    pro="waiting for process"
    if fileupload.objects.filter(crimearea=carea).exists():
        fi=fileupload.objects.get(crimearea=carea)
        if fileupload.objects.filter(crimename=crna).exists():
           val=fi.value
           if val=="3":
               pro="Process  Finished"
           elif val=="2":
                pro="proces Ongoing"
           else:
                pass
            
    return render(request,"complainstatus.html",{'fn':fn,'comp':comp,'pro':pro})

def missingstatus(request):
    Email= request.session['email']
    reg=register_form.objects.get(Email=Email)
    fn=reg.Name
    comp=Missing.objects.all()
    return render(request,"missingstatus.html",{'fn':fn,'comp':comp})

def AddMissing(request):
    Email= request.session['email']
    reg=register_form.objects.get(Email=Email)
    fn=reg.Name
    return render(request,"AddMissing.html",{'fn':fn})

def branchlogin(request):
    meg="Login sucessfully"
    comp=Missing.objects.all()
    bnname = request.POST.get('user')
    bpass = request.POST.get('Password')
    
  
    if branches.objects.filter(bnname=bnname).exists():

        if branches.objects.filter(bpass=bpass).exists():
            meg="Login sucessfully"
            reg=branches.objects.get(bnname=bnname)
            fn=reg.bnname
            request.session['bnname']=bnname
            return render(request,'policehome.html',{'meg':meg,'fn':fn})
        else:
            print("password is not correct")
            meg="password is not correct..."
            return render(request,'Run_Here.html',{'meg':meg})   
    else:
        print('Email is not there...')
        meg="Email is not there..."
        return render(request,'Run_Here.html',{'meg':meg})

def chatpolice(request):
    bnname=request.session['bnname']
    reg=branches.objects.all()
    return render(request,"chatpolice.html",{'bnname':bnname,'reg':reg})
    

def branch(request):
    bnname = request.POST.get('bnname')
    bpass = request.POST.get('bpass')
    barea = request.POST.get('barea')
    address = request.POST.get('address')
    nopolice = request.POST.get('nopolice')
    profile = request.FILES.get('profile')
    meg="added sucessfully"
    print("profile",profile)
    if branches.objects.filter(bnname=bnname).exists():
        braa=branches.objects.get(bnname=bnname)
        pid=braa.id
        bran=branches(id=pid,bnname=bnname,bpass=bpass,barea=barea,address=address,nopolice=nopolice,profile=profile)
        bran.save();
        return render(request,"addpolice.html",{'meg':meg})
    else:
        bran=branches(bnname=bnname,bpass=bpass,barea=barea,address=address,nopolice=nopolice,profile=profile)
        bran.save();
        return render(request,"addpolice.html",{'meg':meg})

def chatpolice2(request):
    bnname=request.session['bnname']
    bbna = request.POST.get('bbna')
    fmg=chatregg.objects.filter(fromm=bnname)
    tmg=chatregg.objects.filter(too=bnname)
    return render(request,"chatpolice2.html",{'bnname':bnname,'bbna':bbna,'fmg':fmg,'tmg':tmg})

def chatreg(request):
    bnname=request.session['bnname']
    dchatt = request.POST.get('dchatt')
    fromm = request.POST.get('bib')
    too = request.POST.get('to')
    ts = time.time()   
    date = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d')
    timestamp = datetime.datetime.fromtimestamp(ts).strftime('%H:%M:%S')
    chat=chatregg(date=date,time_h_m_s=timestamp,dchatt=dchatt,fromm=fromm,too=too)
    tmg=chatregg.objects.filter(too=bnname)
    chat.save();
    fmg=chatregg.objects.filter(fromm=bnname)
    return render(request,"chatpolice2.html",{'bnname':bnname,'bbna':too,'fmg':fmg,'tmg':tmg})

def admincheck(request):
    username = request.POST.get('user')
    password = request.POST.get('Password')
    user = auth.authenticate(username=username,password=password)
   
    if user is not None:
        auth.login(request,user)
        meg="Login sucessfully"
        return render(request,"addpolice.html",{'meg':meg})
    else:
        print("invalid credentials")
       
        return render(request,'Run_Here.html',{'meg':meg}) 

def logincheck(request): 
 
    Email = request.POST.get('Email')
    Password = request.POST.get('Password')
    username = request.POST.get('user')
  
    if register_form.objects.filter(Email=Email).exists():

        if register_form.objects.filter(Password=Password).exists():
            meg="Login sucessfully"
            reg=register_form.objects.get(Password=Password)
            fn=reg.Name
            request.session['email'] = Email
            return render(request,'index.html',{'meg':meg,'fn':fn})
        else:
            print("password is not correct")
            meg="password is not correct..."
            return render(request,'Run_Here.html',{'meg':meg})   
    else:
        print('Email is not there...')
        meg="Email is not there..."
        return render(request,'Run_Here.html',{'meg':meg})
 
def areas(request):
    Email= request.session['email']
    reg=register_form.objects.get(Email=Email)
    fn=reg.Name
    cursor = conn.cursor()
    cursor.execute("SELECT Email FROM crime_area ")
    myresult = cursor.fetchall() 
    if myresult!=[]:
        land=area.objects.filter(Email=Email)
        if area.objects.filter(Email=Email).exists():
            update="You Already Register Area" 
            regss="update your address"  
            return render(request,"areareg.html",{'fn':fn,'update':update,'land':land,'regss':regss})
        else:
            regs="Register Your Area"
            return render(request,"areareg.html",{'fn':fn,'regs':regs})
    else:
        regs="Register Your Area"
        return render(request,"areareg.html",{'fn':fn,'regs':regs})
    return render(request,"areareg.html",{'fn':fn})


def register(request):
    if request.method == 'POST':
        Name = request.POST['Name']
        Email = request.POST['Email']
        Password = request.POST['Password']
        Phone = request.POST['Phone']

        if register_form.objects.filter(Email=Email).exists():
            print('Email id is taken')
            meg="Email id is  already taken"
            return render(request,'Run_Here.html',{'meg':meg})
        elif register_form.objects.filter(Name=Name).exists():
            print('Username is  already taken')
            meg="Username is taken"
            return render(request,'Run_Here.html',{'meg':meg})
        else:
            reg = register_form(Name=Name,Email=Email,Password=Password,Phone=Phone)
            
            reg.save();
            print("user is created")
            meg="user is created"
            return render(request,"Run_Here.html",{'meg':meg})
        return render(request,'Run_Here.html')

def publiccomp(request):
    if request.method == 'POST':
        location = request.POST['location']
        area = request.POST['area']
        detail = request.POST['detail']
        ts = time.time()   
        date = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d')
        timestamp = datetime.datetime.fromtimestamp(ts).strftime('%H:%M:%S')
        print(timestamp)
        print(date)
        reg = complaint(location=location,area=area,detail=detail,date=date,time_h_m_s=timestamp)
        if complaint.objects.filter(detail=detail).exists():
            msg="this sentence already stored so please paraphase your sentence"
        else:
            msg="Registered your compliant"
            reg.save();
    return render(request,"publiccomplaint.html",{'msg':msg})

def areareg(request):
    if request.method == 'POST':
        doorno = request.POST['doorno']
        stname = request.POST['stname']
        villcit = request.POST['villcit']
        district = request.POST['district']
        state = request.POST['state']
        pincode = request.POST['pincode']
        contactnumber = request.POST['contactnumber']
        Email= request.session['email']
        reg=register_form.objects.get(Email=Email)
        fn=reg.Name
        pid=reg.id
        update="You Already Register Area" 
        cursor = conn.cursor()
        cursor.execute("SELECT Email FROM crime_area")
        myresult = cursor.fetchall()
        
        land = area(id=pid,stname=stname,Email=Email,doorno=doorno,villcit=villcit,district=district,state=state,pincode=pincode,contactnumber=contactnumber)  
        if myresult!=[]:
            if area.objects.filter(Email=Email).exists():
                landy=area.objects.filter(Email=Email)
                landy.delete();
                landy=area.objects.filter(Email=Email)
                land.save();
                meg="updated sucessfully"
                return render(request,"areareg.html",{'fn':fn,'update':update,'meg':meg,'land':landy})
            else:
                meg="Register sucessfully"
                land.save();
                return render(request,"index.html",{'fn':fn,'update':update,'meg':meg})
        else:
            meg="Register sucessfully"
            land.save();
            return render(request,"index.html",{'fn':fn,'update':update,'meg':meg})

def ccomplaint(request):
    firstname = request.POST.get('firstname')
    lastname = request.POST.get('lastname')
    carea = request.POST.get('carea')
    wip = request.POST.get('wip')
    image = request.FILES.get('image')
    detail = request.POST.get('detail')
    Email= request.session['email']
    regg=register_form.objects.get(Email=Email)
    fn=regg.Name
    cname=firstname+" "+lastname
    if complaint_details.objects.filter(cname=cname).exists():
        cc=complaint_details.objects.get(cname=cname)
        pid=cc.id
        reg = complaint_details(id=pid,cname=cname,firstname=firstname,lastname=lastname,Email=Email,carea=carea,wip=wip,detail=detail,image=image)
    else:
        reg = complaint_details(cname=cname,firstname=firstname,lastname=lastname,Email=Email,carea=carea,wip=wip,detail=detail,image=image)
    reg.save();
    meg="complaint added "
    return render(request,'index.html',{'meg':meg,'fn':fn})

def addcrime(request):
    firstname = request.POST.get('firstname')
    lastname = request.POST.get('lastname')
    carea = request.POST.get('carea')
    ctype = request.POST.get('ctype')
    image = request.FILES.get('image')
    bnname = request.FILES.get('uid')
    meg="complaint added "
    bn=request.session['bnname']
    reg=addcriminalls.objects.get(firstname=firstname)
    pid=reg.id
    fn=reg.firstname
    if fn==firstname:
        reg = addcriminalls(id=pid,firstname=firstname,lastname=lastname,carea=carea,ctype=ctype,image=image,bnname=bnname)
        reg.save();
    else:
        reg = addcriminalls(firstname=firstname,lastname=lastname,carea=carea,ctype=ctype,image=image,bnname=bnname)
        reg.save();
    return render(request,"addcriminals.html",{'bn':bn,'meg':meg})

def Missing_details(request):
    firstname = request.POST.get('firstname')
    lastname = request.POST.get('lastname')
    perno = request.POST.get('perno')
    missedarea = request.POST.get('missedarea')
    image = request.FILES.get('image')
    my_content = request.POST.get('my_content')
    Email= request.session['email']
    reg=register_form.objects.get(Email=Email)
    pid=reg.id
    fn=reg.Name
    reg = Missing(id=pid,firstname=firstname,lastname=lastname,Email=Email,perno=perno,missedarea=missedarea,my_content=my_content,image=image)
    reg.save();
    meg="Missing complaint added "
    return render(request,'index.html',{'meg':meg,'fn':fn})

def policehome(request):
    comp=Missing.objects.all()
    bnname=request.session['bnname']
    return render(request,"policehome.html",{'comp':comp})

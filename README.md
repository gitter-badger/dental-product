#PSU Dental

An e-commerce website for dental products for PSU students.                                                 
###Purpose

Why this website exists

###Authors

 * **Danny Fan**
 * **Prithaj Nath**
   	 * Designed UI/UX using Bootstrap 
	 * Implented the design in accordance with the MVC framework
	 * Added interactivity using JQuery
	 * Integrated the View with the Model and the Controller
 * **Sergio Andujar**
 * **Rahul Arora**
 * **Trevan Albright**                                                         

###How it works

Purpose of files and folders go here

```
myapp                      # Application directory
|- script                  # Script directory
|  +- my_app               # Application script
|- lib                     # Library directory
|  |- MyApp.pm             # Application class
|  +- MyApp                # Application namespace
|     +- Controller        # Controller namespace
|        +- Example.pm     # Controller class
|- t                      
|  +- basic.t             
|- log                     
|  +- development.log      
|- public                  
|  +- index.html         
+- templates             
   |- layouts              
   |  +- default.html.ep   
   +- example             
      +- welcome.html.ep 
```
                                                      
##Install

In order to get started with our application, you would need to have Git installed in our system.

1. **Mac/Linux** - Most Linux distros and Mac OSs come with Git installed. However, if you don't have Git installed in your system, run the following command in your terminal.

```
	sudo apt-get install git
```

This should install Git in your system. Just to make sure, run the following command which tells you which version of Git you have installed.

```
 git --version

``` 
Now, you would have to clone our GitHub repository in order to get access to our files. Run the following command to create a local copy of our GitHub repo in whichever folder you may please.

```
 git clone https://github.com/dfan001/dental-product.git

```
                                                                                                                                                                                                                                     
Now that you have a copy of our GitHub repo, you can start our application using Morbo. Navigate to the **my_app** file using the above diagram and run the following command

```
morbo my_app

```
You should see something like this after you run this command

```
Server available at http://127.0.0.1:7992

```
Keep in mind that you can have a different port number. As long as you don't get any errors, you're all set!!
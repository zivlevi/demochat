![Let's Chat Greylock](http://i.imgur.com/0a3l5VF.png)


Use this tutorial to familiarize yourself with codefresh.yml file and codefresh functionality.

![Screenshot](http://i.imgur.com/C4uMD67.png)


This tutorial is based on let’s chat [app].

https://github.com/containers101/demochat

### Let’s chat is self-hosted chat app for small teams or big

This tutorial will walk you through the process of adding the following :


* Build step - that will build Docker image for your let’s chat app

* Push to registry step - that will push your image to Docker Hub

* Unit Test step - A freestyle step that runs the unit test of the demo chat after the build 

* Composition step - This step will run a composition which use your chat image from the build step, Docker image of curl 
and check if your application is responsive. It will do so by printing "works" if a curl command to our app at port 5000 succeed.  

So, the first thing you need to do is :

## Fork our repo  

Enter the following link and fork let’s chat app!: https://github.com/containers101/demochat


## Add a service
Now enter Codefresh and add your let’s chat app as a Codefresh service.

Click on ___Add New Service___

![Screenshot](http://i.imgur.com/2tGNxQu.png)


Now add your forked demochat repo.

![Screenshot](http://i.imgur.com/HPCUtQx.png)

Enter the forked repo url and choose the branch for your first build (in this case ```master```)

When you finish press ___next___.

![Screenshot](http://i.imgur.com/71xBMRZ.png)

Select how you would like to setup your repository. In this case, our repo has a Dockerfile, so we'll select the middle option. 


![Screenshot](http://i.imgur.com/KCAkK2u.png)

By default, Codefresh searches for your Dockerfile at the root level of your repository, by the name Dockerfile. The demo-chat example includes a Dockerfile in the root level.

![Screenshot](http://i.imgur.com/a65tw0v.png)


Review your Dockerfile, and click Create to add your repository.

![Screenshot](http://i.imgur.com/yb0xCtp.png)

pressing on ___build___  button will trigger a regular build 

![Screenshot](http://i.imgur.com/QdRQDxo.png)

Great, you  are running  your build for the first time!

## Push your image to docker registry
Click on Repositories, and then click on the Pipelines gear.

![Screenshot](http://i.imgur.com/QmZPo42.png)

Scroll down to Workflow, and you will see a "Push to Docker" button. If you have set up your credentials, click Save at the bottom of the screen. Otherwise- click on the "integration page" link.

Write your User/Password info, and click Save to connect.

![Screenshot](http://i.imgur.com/rISBne8.png)


## Unit test your image
Let's head over to Piplines again.
![Screenshot](http://i.imgur.com/QmZPo42.png)

Scroll down to Workflow under "Build and Unit Test"

We'll type in ```echo $(date)``` in the Unit Test Script area. This will print the date, and we'll be able to see our test in action.

Let's click Save, and Build to see it in action.

Great- the date has been printed!

![Screenshot](http://i.imgur.com/NzduV1K.png)
 
 
Now let's add a full composition that contains the chat and mongo db


## Add composition

Our lets chat app needs a mongo in order to work , so let's add it!

you can read more about compositions in our docs, but we will also walk through the process here :
https://docs.codefresh.io/docs/create-composition


Click the Composition view icon in the left pane, and click the Add Composition.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/1.png)

Choose a name for your composition

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/2.png)

We'll be using a file from our repo, so select the appropriate option.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/3.png)

We will be selecting containers101/demochat from our list. If it is not appearing, click "Add by URL" and enter https://github.com/containers101/demochat

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/4.png)




go to codefresh and choose  __compositions__ tab
and press __add new composition__ 

![Screenshot](screenshots/2016-09-28_1915.png)
 
 
toggele to __advance__ mode , add the composition 
and choose a name for it (in this case ```demo-chat-example```)
![Screenshot](screenshots/2016-09-28_1918.png)

when you finish press on the save icon ![Screenshot](screenshots/2016-09-28_1921.png)
and launch your composition ![Screenshot](screenshots/2016-09-29_1552.png)


![Screenshot](screenshots/2016-09-29_1549.png)

and if you enter the link at the bottom you can see the lets chat app
![Screenshot](screenshots/2016-09-29_1550.png)
now add integration test to your YAML file.

##Add composition step
add the following step to your codefresh.yml file


```
composition-step:
      type: composition
      composition: demo-chat-example
      composition-candidates:
        main:
          image: nhoag/curl
          command: bash -c "sleep 20 && curl http://app:5000/" | echo 'works'
```
under ```composition``` you need to put the name of composition from the last step in order to use it
(in this case ```demo-chat-example```)
in this step codefresh will use the ```nhoag/curl``` image that can run this command : ```bash -c "sleep 20 && curl http://app:5000/" | echo 'works'```
which will print "works" if a curl command to your app at port 5000 succeed.

you can read more about composition step in our docs :
 https://docs.codefresh.io/docs/steps

run the build
![Screenshot](screenshots/2016-09-29_1728.png)
success !


[app]: https://github.com/containers101/demochat


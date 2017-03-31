![Let's Chat Greylock](https://codefresh.io/wp-content/uploads/2017/03/lets-chat.png)


Use this tutorial to familiarize yourself with codefresh.yml file and codefresh functionality.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/11.png)


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

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/12.png)


Now add your forked demochat repo.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/13.png)

Enter the forked repo url and choose the branch for your first build (in this case ```master```)

When you finish press ___next___.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/14.png)

Select how you would like to setup your repository. In this case, our repo has a Dockerfile, so we'll select the middle option. 


![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/15.png)

By default, Codefresh searches for your Dockerfile at the root level of your repository, by the name Dockerfile. The demo-chat example includes a Dockerfile in the root level.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/16.png)


Review your Dockerfile, and click Create to add your repository.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/17.png)

Clicking on ___build___  button will trigger a regular build.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/18.png)

Great, you  are running  your build for the first time!

## Push your image to docker registry
Click on Repositories, and then click on the Pipelines gear.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/19.png)

Scroll down to Workflow, and you will see a "Push to Docker" button. If you have set up your credentials, click Save at the bottom of the screen. Otherwise- click on the "integration page" link.

Write your User/Password info, and click Save to connect.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/20.png)


## Unit test your image
Let's head over to Piplines again.
![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/19.png)

Scroll down to Workflow under "Build and Unit Test"

We'll type in ```echo $(date)``` in the Unit Test Script area. This will print the date, and we'll be able to see our test in action.

Let's click Save, and Build to see it in action.

Great- the date has been printed!

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/22.png)
 
 
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


We know our Docker Compose file is at the root of our directory, so we'll click next

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/5.png)


Now we will review and update our yml. Looks good- let's click next.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/6.png)


Codefresh doesn't support Build property of compose, so it has replaced it with images built by pipeline. We can go ahead and click Create here.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/7.png)


Everything looks good here- so let's go ahead and launch...


![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/8.png)


Once it has completed, a link to our app will be displayed. Let's click it to see if it worked.


![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/9.png)

Success! We have successfully launched a composition.

![Screenshot](https://codefresh.io/wp-content/uploads/2017/03/10.png)



[app]: https://github.com/containers101/demochat


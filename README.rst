docker-python-3.6.0-jessie-nodejs
----------------------------------
Debian Jessie with python 3.6.0, NodeJS, NVM, git, python-pip preinstalled

Used for Plone/Django test runners in Gitlab CI.

To use::

$ docker pull gw20e/jessie-py3.6.0-nodejs
    
    
Gitlab CI
=========

In your `gitlab-ci.yml` file add the image statement to use this image::

    image: gw20e/jessie-py3.6.0-nodejs

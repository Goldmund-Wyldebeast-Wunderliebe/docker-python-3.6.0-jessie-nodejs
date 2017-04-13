=================================
docker-python-3.6.0-jessie-nodejs
=================================
Debian Jessie with python 3.6.0, NodeJS, NVM, git, python3-pip, Java 8 and ElasticSearch 2.x preinstalled.

Used for Plone/Django test runners in Gitlab CI.

Usage
=====

To pull:

.. code-block:: sh

	docker pull gw20e/jessie-py3.6.0-nodejs:java-8-elasticsearch-2.x

To push:

.. code-block:: sh

	docker build -t gw20e/jessie-py3.6.0-nodejs .
	docker tag gw20e/jessie-py3.6.0-nodejs gw20e/jessie-py3.6.0-nodejs:elastic-2.x

To run:

.. code-block:: sh

	docker run -p 9200:9200 -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" gw20e/jessie-py3.6.0-nodejs:elastic-2.x

Gitlab CI
=========

In your `gitlab-ci.yml` file add the image statement to use this image:

.. code-block:: text

    image: gw20e/jessie-py3.6.0-nodejs:elastic-2.x

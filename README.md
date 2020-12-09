# Prices API

Prices API is an HTTP-based API capable of returning average prices, absolute difference, percentage difference for each day on a route between Port Codes origin and destination

## Installation

Install virtual enviroonment  [virtualenv](https://virtualenv.pypa.io/en/stable/installation/) for Dependency Management

```bash
pip install virtualenv
```
Create and Activate a virtual environment

```bash
virtualenv --python=python3 my_prices_task_env
source my_prices_task_env/bin/activate
```
Use the package manager [pip](https://pip.pypa.io/en/stable/) to install requirements.txt.

```bash
pip install --upgrade -r requirements.txt
```
Execute Dockerfile and start the container
```bash
docker build -t prices_task .
docker run -p 0.0.0.0:5432:5432 --name prices_task prices_task
```

Run the server
```bash
python manage.py runserver 8000
```
Open  [localhost:8000](http://localhost:8000/)  in a browser to see the Swagger API  Documentation

Open  [localhost:8000/api](http://localhost:8000/api/)  in a browser to see the available API

Open  [localhost:8000/api/schema](http://localhost:8000/api/schema/)  in a browser to see the schema of all API

## GET API

## My-prices API
API endpoint that takes the following parameters:
day
customer

Returns a list with the prices that given customer has on the given day, compared against average price across all customers for the same orig/dest combo on the same day. Comparison should include absolute difference of customer price versus average, as well as percentage difference.

```bash
curl -X GET -H 'Content-Type: application/json'  http://localhost:8000/api/my-prices/2016-01-01/Acme%20Inc./

[{
	"status": "success",
	"data": [{
			"average": 587.0,
			"percent_diff": 14.821124361158432,
			"price": 500,
			"origin_code": "CNSGH",
			"destination_code": "DEHAM",
			"absolute_diff": 87.0
		},
		{
			"average": 587.0,
			"percent_diff": 48.89267461669506,
			"price": 300,
			"origin_code": "CNSGH",
			"destination_code": "BEANR",
			"absolute_diff": 287.0
		},
    	...
	]
}]
```

## POST API

### Compare-Price API
API endpoint where you can upload a price, including the following parameters:
day
origin_code
destination_code
price
currency

API endpoint should compare uploaded price against average price for the same orig/dest combo on the same day. Response should include absolute difference of the uploaded price versus average, as well as percentage difference.

```bash
curl -X POST -d '''{"day": "2016-01-01", "origin_code": "CNSGH","destination_code": "NLRTM","price": 645, "currency": "USD"}''' -H "Content-Type: application/json" http://127.0.0.1:8000/api/compare-price/

[{
	"status": "success",
	"data": {
		"average": 761.25,
		"percent_diff": 15.270935960591133,
		"absolute_diff": 116.25
	}
}]
```

## Batch processing
###### For Batch processing, we will examine the below factors,

1. Networking or the number of calls we need to make, is often the bottleneck when batch processing.

2. Adoption of public clouds such as AWS has made it easy to scale up the processing power, RAM, or storage of our applications, but each networking call still needs to negotiate a complicated and unreliable global network of computers, routers, switches, and protocols, such as TCP, adding a lot of overhead for each call.

3. Therefore, it's usually better to make fewer requests with more data (e.g. upload multiple price points) as opposed to making more requests with fewer data (e.g.upload single price point) in each request.

4. Google Drives batch processing API request format (https://developers.google.com/drive/api/v3/batch), is very flexible but it's more complicated to set up a POST API in this format, moreover, we have,
    i) Only one POST API to be handled in this scenario.
    ii) The input data structure for each POST request is the same.

5. Considering the above factors we will create an API similar to the approach chosen by ZenDesk (https://developer.zendesk.com/rest_api/docs/support/users#create-or-update-many-users),

     i) We will create an POST API endpoint where it will accept an array of inputs instead of a single input,

     ```bash
     [{"day": "2016-01-01","origin_code": "CNSGH","destination_code": "NLRTM","price": 645,"currency": "USD"},
    {"day": "2016-01-02","origin_code": "CNSGH","destination_code": "NLRTM","price": 593,"currency": "USD"}]
    ```

    ii) We will set a limit for the number of input fields according to the limitations.
    iii) At the backend we will handle multiple requests by creating asynchronous background jobs (Celery + RabbitMQ) to do the work, and return the respective job ID.
    This endpoint returns a job_status JSON object.
    Use the Show Job Status endpoint to check for the job's completion.

     ```bash
    curl -X POST -d '''[{"day": "2016-01-01","origin_code": "CNSGH","destination_code": "NLRTM","price": 645,"currency": "USD"}, {"day": "2016-01-02","origin_code": "CNSGH","destination_code": "NLRTM","price": 593,"currency": "USD"}]''' -H "Content-Type: application/json" http://127.0.0.1:8000/api/compare-price/
    [{
     	"job_statuses": [{
     		"id": "8b726e606741012ffc2d782bcb7848ff",
     		"status": "queued",
     		"total": 2,
     		"progress": '10%',
     		"message": 'started',
     		"results": null
     	}]
     }]
     ```
     v) We will create another GET API which accepts job_statuses id
     and returns back the job status. We can also write GET API in a way such that it accepts multiple job_statuses ids and return backs the results
     as this will be helpful if we are setting a limit for inputs in the POST API.
     The "results" array in a response lists the resources that were successfully and unsuccessfully uploaded.

6. The advantage of this approach is that it is simple to use. If users of our API know how to create a single resource, they can easily modify their existing code to pass through an array, instead of a single resource.

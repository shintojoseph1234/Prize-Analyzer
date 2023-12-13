# Price Analyzer

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

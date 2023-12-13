"""
Django settings for prices_task project.
"""
# Other libraries
import os
import json


# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '!%=w3ii0+#k7u*(b&7t53qgr24@(h8iq@5#dry-ieqo-%hrkq&'
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
# Allowed hosts
#ALLOWED_HOSTS = ['localhost', '127.0.0.1']
ALLOWED_HOSTS = ['*']
#ALLOWED_HOSTS = ['']

# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # custom apps
    'api',
    'rest_framework',
    'rest_framework_swagger'
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'prices_task.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'prices_task.wsgi.application'

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': ['rest_framework.permissions.AllowAny'],
    'DEFAULT_SCHEMA_CLASS': 'rest_framework.schemas.coreapi.AutoSchema',
    'TEST_REQUEST_DEFAULT_FORMAT': 'json',
}

# postgress database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'xeneta-my-rates',
        'HOST': '0.0.0.0',
        #'HOST': '10.0.142.142',
        'PORT': '5432',
    }
}

# Password validation
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# set to True if using https SSL redirects
# SECURE_SSL_REDIRECT = False
# SECURE_HSTS_SECONDS = 0

X_FRAME_OPTIONS = 'DENY'

CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True

SECURE_CONTENT_TYPE_NOSNIFF = True
SECURE_BROWSER_XSS_FILTER = True

# Internationalization
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True


# Static files (CSS, JavaScript, Images)
STATIC_URL = '/static/'
import os
STATIC_ROOT = os.path.join(BASE_DIR, 'static/')
#STATICFILES_DIRS = [
#    os.path.join(BASE_DIR,'static') 
#]

# config file path
CONFIGURATION_FILE = os.path.join(BASE_DIR, '.configs/config.json')
# open configuration file
config_file = open(CONFIGURATION_FILE)
# get the configuration data from the file
config_data = json.load(config_file)
# close the config file
config_file.close()

# Configuration of exchange rate API
EXCHANGE_RATES_URL  = config_data['exchange_rates']['url']
EXCHANGE_APP_ID     = config_data['exchange_rates']['app_id']

SWAGGER_SETTINGS = {
    'DOC_EXPANSION': 'list',
}


# import the staticfiles_urlpatterns
#from django.contrib.staticfiles.urls import staticfiles_urlpatterns

# below line have to be the last line of the file
#urlpatterns += staticfiles_urlpatterns()

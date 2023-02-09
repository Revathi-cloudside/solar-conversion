"""
Django settings for kutbill project.

Generated by 'django-admin startproject' using Django 4.1.5.

For more information on this file, see
https://docs.djangoproject.com/en/4.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.1/ref/settings/
"""

from pathlib import Path
import os, pytz;

from rest_framework import status
import socket

import django
from django.utils.encoding import smart_str, force_str
django.utils.encoding.smart_text = smart_str

django.utils.encoding.force_unicode = force_str

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-ofi^^r=5@e+#i054r-i-dkx=5%2q@l=ngqa^qwlv_o#!tjn_e)'

CASSANDRA_UPDATE = True

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'django.contrib.humanize',
    'bootstrapform',
    'bootstrap3',
    'rest_framework',
    'allauth',
    'allauth.account',
    'allauth.socialaccount',
    'django_extensions',
    'django_crontab',
    'organizations',
    'website',
    'dashboards',
    'dataglen',
    'cronjobs',
    'rest_framework.authtoken',
    'rest_framework_swagger',
    'django_comments',
    'guardian',
    'action',
    # 'actionconfig',
    'config',
    'errors',
    'monitoring',
    'logger',
    'solarrms',
    'tagging',
    'customwidgets',
    'helpdesk',
    'events',
    'ioelab',
    'license',
    'microgrid',
    'oandmmanager',
    'otp',
    'dgusers',
    'features',
    'dganalysis',
    'dgcomments',
    'widgets',
    'dwebdyn',
]

# INSTALLED_APPS = ('django_cassandra_engine',) + INSTALLED_APPS
SITE_ID = 1
COMMENTS_APP = 'dgcomments'

ACCOUNT_EMAIL_CONFIRMATION_ANONYMOUS_REDIRECT_URL = ("/accounts/signup/")
ACCOUNT_EMAIL_CONFIRMATION_AUTHENTICATED_REDIRECT_URL = ("/dataglen/")
ANONYMOUS_USER_ID = None
ACCOUNT_ADAPTER = ('dataglen.account_adapter.NoNewUsersAccountAdapter')
ACCOUNT_AUTHENTICATION_METHOD = ("email")
ACCOUNT_CONFIRM_EMAIL_ON_GET = (True)

ACCOUNT_EMAIL_CONFIRMATION_ANONYMOUS_REDIRECT_URL = ("/accounts/signup/")
ACCOUNT_EMAIL_CONFIRMATION_AUTHENTICATED_REDIRECT_URL = ("/dataglen/")
ACCOUNT_EMAIL_CONFIRMATION_EXPIRE_DAYS = (7)
ACCOUNT_DEFAULT_HTTP_PROTOCOL = "https"
ACCOUNT_EMAIL_REQUIRED = (True)
ACCOUNT_EMAIL_VERIFICATION = ("mandatory")
ACCOUNT_LOGOUT_ON_GET = (True)
ACCOUNT_LOGOUT_REDIRECT_URL = ("/")
ACCOUNT_SIGNUP_PASSWORD_VERIFICATION = (True)
ACCOUNT_UNIQUE_EMAIL = (True)
ACCOUNT_USERNAME_REQUIRED = ("True")
ACCOUNT_USERNAME_MIN_LENGTH = (5)
ACCOUNT_PASSWORD_MIN_LENGTH = (6)
ACCOUNT_LOGIN_ON_EMAIL_CONFIRMATION = (True)
ACCOUNT_SESSION_COOKIE_AGE = (1209600)


ACCOUNT_SIGNUP_FORM_CLASS = 'dataglen.forms.SignupForm'

RECAPTCHA_PUBLIC_KEY = '6Ld39wUTAAAAAPejEbOFj0VLQfGPsDtEK9kc7moD'
RECAPTCHA_PRIVATE_KEY = '6Ld39wUTAAAAAFmX1FDfxIfhRdLOHWmTwJsojh6l'
RECAPTCHA_USE_SSL = True
NOCAPTCHA = True
DEBUG_TOOLBAR_PATCH_SETTINGS = False
INTERNAL_IPS = ('127.0.0.1',)

'''
    MIDDLEWARE DETAILS
'''
MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

CORS_ORIGIN_ALLOW_ALL = True

ROOT_URLCONF = 'kutbill.urls'


# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_TZ = True

'''
    STATIC FILE DETAILS
'''
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
# URL prefix for static files.
STATIC_URL = '/static/'

# Additional locations of static files
STATICFILES_DIRS = (
     #os.path.join(BASE_DIR, 'static'),
)



AUTHENTICATION_BACKENDS = (
    # Needed to login by username in Django admin
    'django.contrib.auth.backends.ModelBackend',
    # `allauth` specific authentication methods, such as login by e-mail
    'allauth.account.auth_backends.AuthenticationBackend',
)
INVITATION_BACKEND = 'dashboards.defaults.DataglenInvitationBackend'

SITE_ID = 1

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'kutbill.urls'

TEMPLATE_PATH = os.path.join(BASE_DIR, 'templates')

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        # 'DIRS': [os.path.join(os.path.dirname(__file__) ,'../templates').replace('\\','/')],
        'DIRS': [TEMPLATE_PATH],
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

WSGI_APPLICATION = 'kutbill.wsgi.application'

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    #'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

# Database
# https://docs.djangoproject.com/en/4.1/ref/settings/#databases

DATABASES = {
    'default' : {
        'ENGINE': 'django.db.backends.mysql',
        'NAME' : 'dataglen_meta2',
        'USER' : 'root',
        'PASSWORD': 'password',
        'HOST': '127.0.0.1',
        'PORT' : '3306',
    },

    'cassandra': {
        'ENGINE': 'django_cassandra_engine',
        'NAME': 'dataglen_data',
        'TEST_NAME': 'test_dataglen',
        'HOST': '35.208.221.234',
        'USER': 'cassandra',
        'PASSWORD': 'cassandra',
        'PORT': '9046',
        'OPTIONS': {
            'replication': {
                'strategy_class': 'SimpleStrategy',
                'replication_factor': 1
            },
            'session': {
                'default_timeout': None,
                'default_fetch_size': None,
            }
        }
    }
}


# Password validation
# https://docs.djangoproject.com/en/4.1/ref/settings/#auth-password-validators

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


# Define a router for logging application since we're using a separate database
#DATABASE_ROUTERS = ['logger.routers.LogRouter',]

'''
    LOGGING. DIFFERENT HANDLERS FOR BOTH DATAGLEN AND DATASINK+DATAVIZ.
'''
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,

    'formatters': {
        'verbose': {
            'format': "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt': "%d/%b/%Y %H:%M:%S"
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
        'log_message': {
            'format': '%(message)s'
        },
    },

    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/datasink.log',
            'formatter': 'verbose'
        },
        'file_pdf': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/file_pdf.log',
            'formatter': 'verbose'
        },
        'file_dataglen': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/dataglen.log',
            'formatter': 'verbose'
        },

        'file_dataglen_rest': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/rest_dataglen.log',
            'formatter': 'verbose'
        },

        'file_dataviz': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/dataviz.log',
            'formatter': 'verbose'
        },

        'file_dataglen_cronjobs': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/cronjobs.log',
            'formatter': 'verbose'
        },

        'file_dataglen_logging_errors': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/log_errors.log',
            'formatter': 'verbose'
        },

        'file_dataglen_monitoring_errors': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/monitoring_errors.log',
            'formatter': 'verbose'
        },
        'file_dataglen_celery_logs': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/celery.log',
            'formatter': 'verbose'
        },

        'file_tickets_logs': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/tickets.log',
            'formatter': 'verbose'
        },

        'widgets_log': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/widgets.log',
            'formatter': 'verbose'
        },

        'eventsframework_log': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/kutbill/eventsframework.log',
            'formatter': 'verbose'
        },

    },

    'loggers': {
        'django': {
            'handlers': ['file'],
            'propagate': True,
            'level': 'DEBUG',
        },

        'django-screamshot': {
            'handlers': ['file_pdf'],
            'level': 'DEBUG',
            'propagate': True,
        },

        'datasink.views': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },

        'datasink.apps': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },

        'dataglen.views': {
            'handlers': ['file_dataglen'],
            'level': 'DEBUG',
        },

        'dataglen.rest_views': {
            'handlers': ['file_dataglen_rest'],
            'level': 'DEBUG',
        },

        'logger.tasks': {
            'handlers': ['file_dataglen_logging_errors'],
            'level': 'DEBUG',
        },

        'monitoring.views': {
            'handlers': ['file_dataglen_monitoring_errors'],
            'level': 'DEBUG',
        },

        'cronjobs.views': {
            'handlers': ['file_dataglen_cronjobs'],
            'level': 'DEBUG',
        },

        'django_crontab.crontab': {
            'handlers': ['file_dataglen_cronjobs'],
            'level': 'DEBUG',
        },

        'kutbill.worker': {
            'handlers': ['file_dataglen_celery_logs'],
            'level': 'DEBUG',
        },

        'helpdesk.models': {
            'handlers': ['file_tickets_logs'],
            'level': 'DEBUG',
        },

        'widgets.models': {
            'handlers': ['widgets_log'],
            'level': 'DEBUG',
        },

        'eventsframework.views': {
            'handlers': ['eventsframework_log'],
            'level': 'DEBUG',
        },

    }
}
# Internationalization
# https://docs.djangoproject.com/en/4.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/
STATIC_ROOT = os.path.join(BASE_DIR, 'static')

STATIC_URL = 'static/'

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    #'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

'''
    REGISTRATION RELATED PARAMETERS
'''
# Registration related parameters
REGISTRATION_OPEN = True
ACCOUNT_ACTIVATION_DAYS = 7
REGISTRATION_AUTO_LOGIN = False
LOGIN_URL = '/accounts/login/'
LOGIN_REDIRECT_URL = "/dashboards/redirect/"

'''
    EMAIL CONFIGURATION
'''
# EMAIL_USE_TLS = True
# EMAIL_HOST = 'smtp.gmail.com'
# EMAIL_HOST_USER = 'admin@dataglen.com'
# EMAIL_HOST_PASSWORD = 'n>B=4E8j'
# EMAIL_PORT = 587

EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'alerts@dataglen.com'
EMAIL_HOST_PASSWORD = '8HUrL*JQ'
EMAIL_PORT = 587

'''
    REGISTRATION RELATED PARAMETERS
'''
# Registration related parameters
REGISTRATION_OPEN = True
ACCOUNT_ACTIVATION_DAYS = 7
REGISTRATION_AUTO_LOGIN = False
LOGIN_URL = '/accounts/login/'
LOGIN_REDIRECT_URL = "/dashboards/redirect/"

'''
    REST API CONFIGURATION
'''
REST_FRAMEWORK = {
    # Use Django's standard `django.contrib.auth` permissions,
    # or allow read-only access for unauthenticated users.
#    'DEFAULT_PERMISSION_CLASSES': [
#        'rest_framework.permissions.DjangoModelPermissionsOrAnonReadOnly'
#    ]
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 5000
}

'''
    Website error notifications
'''


class USER_STATUS():
    OWNER = 'OWNER'
    EMPLOYEE = 'EMPLOYEE'
    MEMBER = 'MEMBER'
    UNASSIGNED = 'UNASSIGNED'


class Error():
    def __init__(self, code, description):
        self.code = code
        self.description = description

    def __unicode__(self):
        return self.description


class ERRORS():
    BAD_REQUEST = Error(status.HTTP_400_BAD_REQUEST, 'BAD_REQUEST')
    UNAUTHORIZED_ACCESS = Error(status.HTTP_401_UNAUTHORIZED, 'UNAUTHORIZED_ACCESS')
    METHOD_NOT_ALLOWED = Error(status.HTTP_405_METHOD_NOT_ALLOWED, 'METHOD_NOT_ALLOWED')
    INTERNAL_SERVER_ERROR = Error(status.HTTP_500_INTERNAL_SERVER_ERROR, 'INTERNAL_SERVER_ERROR')
    INVALID_SOURCE_KEY = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_SOURCE_KEY')
    INVALID_DATA_STREAM = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_DATA_STREAM')
    DUPLICATE_SOURCE = Error(status.HTTP_409_CONFLICT, 'DUPLICATE_SOURCE')
    DUPLICATE_STREAM = Error(status.HTTP_409_CONFLICT, 'DUPLICATE_STREAM')
    SOURCE_ACTIVE = Error(status.HTTP_400_BAD_REQUEST, 'SOURCE_ACTIVE')
    SOURCE_INACTIVE = Error(status.HTTP_400_BAD_REQUEST, 'SOURCE_INACTIVE')
    INVALID_DATA = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_DATA')
    INVALID_REQUEST_PARAMETERS = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_REQUEST_PARAMETERS')
    ESSENTIAL_PARAMETERS_MISSING = Error(status.HTTP_400_BAD_REQUEST, 'ESSENTIAL_PARAMETERS_MISSING')
    ERROR_RETRIEVING_PAYLOAD = Error(status.HTTP_400_BAD_REQUEST, 'ERROR_RETRIEVING_PAYLOAD')
    ERROR_SPLITTING_RECORDS = Error(status.HTTP_400_BAD_REQUEST, 'ERROR_SPLITTING_RECORDS')
    ERROR_SPLITTING_STREAMS = Error(status.HTTP_400_BAD_REQUEST, 'ERROR_SPLITTING_STREAMS')
    STREAM_PARSING_FAILED = Error(status.HTTP_400_BAD_REQUEST, 'STREAM_PARSING_FAILED')
    STREAMS_INCONSISTENCY = Error(status.HTTP_500_INTERNAL_SERVER_ERROR, 'STREAMS_INCONSISTENCY')
    DEACTIVATE_BEFORE_DELETE = Error(status.HTTP_400_BAD_REQUEST, 'DEACTIVATE_BEFORE_DELETE')
    ERROR_SAVING_BETA_REQUEST_FORM = Error(status.HTTP_500_INTERNAL_SERVER_ERROR, 'Error processing details. Please write to us at contact@dataglen.com')
    ERROR_NONMATCHING_STREAMS_UID_OWNER = Error(status.HTTP_409_CONFLICT, 'ERROR_NONMATCHING_STREAMS_UID_OWNER')
    STREAM_NAME_MISSING = Error(status.HTTP_400_BAD_REQUEST, 'PROVIDE_AT_LEAST_ONE_STREAM_NAME')
    INVALID_PLANT_SLUG = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_PLANT_SLUG')
    INVALID_INVERTER_KEY = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_INVERTER_KEY')
    INVALID_ACTION_DATA_STREAM = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_ACTION_DATA_STREAM')
    DUPLICATE_ACTION_STREAM = Error(status.HTTP_409_CONFLICT, 'DUPLICATE_ACTION_STREAM')
    INVALID_CONFIG_DATA_STREAM = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_CONFIG_DATA_STREAM')
    DUPLICATE_CONFIG_STREAM = Error(status.HTTP_409_CONFLICT, 'DUPLICATE_CONFIG_STREAM')
    FUTURE_TIMESTAMP = Error(status.HTTP_400_BAD_REQUEST, 'FUTURE_TIMESTAMP')
    SOURCE_CONFIGURATION_ISSUE = Error(status.HTTP_400_BAD_REQUEST, 'SOURCE_CONFIGURATION_ISSUE')
    JSON_PARSE_ERROR = Error(status.HTTP_400_BAD_REQUEST, "JSON parse error - Expecting property name enclosed in double quotes with no comma after the last property")
    INVALID_API_KEY = Error(status.HTTP_401_UNAUTHORIZED, 'INVALID_API_KEY')
    INVALID_EVENT_NAME = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_EVENT_NAME')
    EVENT_NAME_REQUIRED = Error(status.HTTP_400_BAD_REQUEST, 'EVENT_NAME_REQUIRED')
    REQUEST_BODY_EMPTY = Error(status.HTTP_400_BAD_REQUEST, 'REQUEST_BODY_EMPTY')
    NO_PLANT_META_SOURCE = Error(status.HTTP_400_BAD_REQUEST, 'NO_PLANT_META_SOURCE')
    INVALID_AGGREGATOR = Error(status.HTTP_400_BAD_REQUEST, 'INVALID_AGGREGATOR')

class INTERNAL_ERRORS():
    INTERNAL_UNKNOWN_ERROR = Error(0, 'INTERNAL_UNKNOWN_ERROR')
    DATAGLEN_GROUP_DOES_NOT_EXIST = Error(1, 'DATAGLEN_GROUP_DOES_NOT_EXIST')
    DATAGLEN_CLIENT_DOES_NOT_EXIST = Error(2, 'DATAGLEN_CLIENT_DOES_NOT_EXIST')
    DATAGLEN_USER_DOES_NOT_EXIST = Error(3, 'DATAGLEN_USER_DOES_NOT_EXIST')

class DATA_COUNT_PERIODS():
    AGGREGATED = 0
    SECOND = 1
    MINUTE = 60
    FIVE_MINTUES = 60*5
    FIFTEEN_MINUTUES = 60*15
    HOUR = 60*60
    DAILY = 60*60*24
    WEEK = 60*60*24*7
    MONTH = 60*60*24*7*4


class TIMESTAMP_TYPES():
    BASED_ON_REQUEST_ARRIVAL = 'BASED_ON_REQUEST_ARRIVAL'
    BASED_ON_TIMESTAMP_IN_DATA = 'BASED_ON_TIMESTAMP_IN_DATA'
    BASED_ON_END_TIME_SLOT = 'BASED_ON_END_TIME_SLOT'
    BASED_ON_START_TIME_SLOT = 'BASED_ON_START_TIME_SLOT'


TIMEZONE_CHOICES = [(zone, zone) for zone in pytz.all_timezones]

# TODO CLEAN THIS DICTIONARY!
DATAGLEN  = {
        'DATA_FORMATS' : (('JSON', 'JSON'),
                        ('CSV', 'CSV')),


        'DATA_TYPES': (('INTEGER', 'Integer'),
                       ('BOOLEAN', 'Boolean'),
                       ('STRING', 'String'),
                       ('FLOAT', 'Float'),
                       ('LONG', 'Long'),
                       ('MAC', 'Mac'),
                       ('TIMESTAMP', 'Timestamp'),
                       ('DATE', 'Date'),
                       ('TIME', 'Time')),

        # in seconds
        'LOG_EXPIRY' : 604800*4,

        'DISCARDED_RECORDS_UI_WINDOW_MINUTES': 300,
        'DISCARDED_RECORDS_UI_WINDOW_NUMBERS': 500,
}

#Contact Us
contact_email = ['sunilkrghai@dataglen.com', 'tanuja@dataglen.com', 'dpseetharam@dataglen.com', 'rajat@dataglen.com','obu@dataglen.com', 'catherine@dataglen.com']
#contact_email = ['nishant@dataglen.com', 'siddharthpandey@dataglen.com']
from_email = 'alerts@dataglen.com'
PR_Email = ['sunilkrghai@dataglen.com', 'tanuja@dataglen.com', 'nishant@dataglen.com']

# KAFKA details
#KAFKA_HOSTS = ['139.162.25.193:9092', '172.104.49.5:9092', '13.127.17.99:9092']#, '139.162.43.87:9092'] # 'kafka.dataglen.org:9092' and 'analytics.dataglen.org' # this is a host with 6 hours of log retention policy
KAFKA_HOSTS = ['172.104.168.119:9092','13.127.17.99:9092']
KAFKA_WRITE_TO_HOSTS = [True, True]
if CASSANDRA_UPDATE:
    KAFKA_HOSTS = ['10.148.0.8:9093,10.148.0.11:9093']
    KAFKA_WRITE_TO_HOSTS = [True]

KAFKA_WRITE = True
#KAFKA_WRITE_TO_HOSTS = [True, False, True]#, True]

# ZOOKEEPER details not using below IP's
ZOOKEEPER_HOST = '172.104.168.119'
if CASSANDRA_UPDATE:
    ZOOKEEPER_HOST = '10.148.0.8, 10.148.0.11, 10.148.0.6'
ZOOKEEPER_PORT = 2181

#R server for cleaning
R_SERVER_HOST = 'http://kafkastaging.dataglen.org'
if CASSANDRA_UPDATE:
    R_SERVER_HOST = 'http://10.148.0.11'

# cleaning threshold percentage
CLEANING_THRESHOLD_PERCENT = 2

X_FRAME_OPTIONS = 'ALLOWALL'

if CASSANDRA_UPDATE:
    SCREAMSHOT_CONFIG = {
        'CASPERJS_CMD': '/usr/local/bin/casperjs',
        'CAPTURE_METHOD': 'casperjs',
        'TEST_CAPTURE_SCRIPT': False
    }

DG_CELERY_TASK_PATH = ('solarrms.cron_new_tickets.new_solar_events_check_for_a_plant', )
AJB_TEMPLATE = 'AJB_TEMPLATE'
ENERGY_METER_TEMPLATE = 'ENERGY_METER_TEMPLATE'
# Default primary key field type
# https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

#Solutions Infini details
SMS_KEY = 'A7c038153c8d4455a8cfad37d44a025dd'
if CASSANDRA_UPDATE:
    #TODO change KEY as previous once google server is live
    SMS_KEY = 'A7c038153c8d4455a8cfad37d44a025dd'
SMS_SENDER = 'DGTECH'
SMS_URL = 'http://api-alerts.solutionsinfini.com/v3/'
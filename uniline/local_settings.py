# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'uniline',
        'USER': 'root',
        'PASSWORD': '123abc',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}
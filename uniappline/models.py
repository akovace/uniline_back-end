from __future__ import unicode_literals

from django.db import models

class Property(models.Model):
    TUR_TAX = (
        ('included', 'included'),
        ('not-included', 'not-included'),
        ('on-the-spot', 'on-the-spot')
    )
    name = models.CharField(max_length=200)
    destitnation = models.CharField(max_length=200)
    tourist_tax = models.CharField(max_length=200, choices=TUR_TAX)

    def __unicode__(self):
        return u'%s' % (self.name)

    class Meta:
        db_table = 'property'

class Unit(models.Model):
    TYPE = (
        ('apartment', 'apartment'),
        ('room', 'room'),
        ('house', 'house'),
    )
    property = models.ForeignKey(Property, related_name='tur_obj')
    name = models.CharField(max_length=200)
    type = models.CharField(max_length=200, choices=TYPE)

    def __unicode__(self):
        return u'%s' % (self.name)

    class Meta:
        db_table = 'unit'

class Base_price(models.Model):
    unit = models.ForeignKey(Unit, related_name='appart_name')
    from_date = models.DateField()
    to_date = models.DateField()
    min_nights = models.IntegerField()
    nr_persons = models.IntegerField()
    checkin_days = models.CharField(max_length=7)
    price = models.DecimalField(max_digits=8, decimal_places=2)

    def __unicode__(self):
        return u'%s' % (self.unit.property.destitnation)

    class Meta:
        db_table = 'base_price'

class Discount(models.Model):
    TYPE_POPUST = (
        ('first-minute','first-minute'),
        ('last-minute','last-minute'),
    )
    property = models.ForeignKey(Property)
    type = models.CharField(max_length=200, choices=TYPE_POPUST)
    days = models.IntegerField()
    percent = models.DecimalField(max_digits=5, decimal_places=2)
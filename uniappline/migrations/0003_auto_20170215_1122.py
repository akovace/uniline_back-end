# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-15 11:22
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('uniappline', '0002_auto_20170215_0855'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='base_price',
            table='base_price',
        ),
        migrations.AlterModelTable(
            name='property',
            table='property',
        ),
        migrations.AlterModelTable(
            name='unit',
            table='unit',
        ),
    ]

# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-14 12:08
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Base_price',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('from_date', models.DateField()),
                ('to_date', models.DateField()),
                ('min_nights', models.IntegerField()),
                ('nr_persons', models.IntegerField()),
                ('checkin_days', models.CharField(max_length=7)),
                ('price', models.DecimalField(decimal_places=2, max_digits=8)),
            ],
        ),
        migrations.CreateModel(
            name='Discount',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(choices=[('first-minute', 'first-minute'), ('last-minute', 'last-minute')], max_length=200)),
                ('days', models.IntegerField()),
                ('percent', models.DecimalField(decimal_places=2, max_digits=5)),
            ],
        ),
        migrations.CreateModel(
            name='Property',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('destitnation', models.CharField(max_length=200)),
                ('tourist_tax', models.CharField(choices=[('included', 'included'), ('not-included', 'not-included'), ('on-the-spot', 'on-the-spot')], max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Unit',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('type', models.CharField(choices=[('apartment', 'apartment'), ('room', 'room'), ('house', 'house')], max_length=200)),
                ('property', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='uniappline.Property')),
            ],
        ),
        migrations.AddField(
            model_name='discount',
            name='property',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='uniappline.Property'),
        ),
        migrations.AddField(
            model_name='base_price',
            name='unit',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='uniappline.Unit'),
        ),
    ]
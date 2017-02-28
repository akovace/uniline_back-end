from rest_framework import serializers
from uniappline.models import Property, Unit, Base_price, Discount
from uniappline.serializers import PropertySerializer


class UnitSerializer(serializers.ModelSerializer):
    property = PropertySerializer(required=True)

    class Meta:
        model = Unit
        fields = ('id', 'property', 'name', 'type')



    def create(self, validated_data):
        """
        Create and return a new `Snippet` instance, given the validated data.
        """
        return Unit.objects.create(**validated_data)

    # def update(self, instance, validated_data):
    #     """
    #     Update and return an existing `Snippet` instance, given the validated data.
    #     """
    #     instance.unit = validated_data.get('unit', instance.unit)
    #     instance.from_date = validated_data.get('from_date', instance.from_date)
    #     instance.to_date = validated_data.get('to_date', instance.to_date)
    #     instance.min_nights = validated_data.get('min_nights', instance.min_nights)
    #     instance.nr_persons = validated_data.get('nr_persons', instance.nr_persons)
    #     instance.checkin_days = validated_data.get('checkin_days', instance.checkin_days)
    #     instance.price = validated_data.get('price', instance.price)
    #     instance.save()
    #     return instance
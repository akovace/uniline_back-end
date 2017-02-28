from rest_framework import serializers
from uniappline.models import Property, Unit, Base_price, Discount


class PropertySerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(required=False, allow_blank=True, max_length=200)
    destitnation = serializers.CharField(required=False, allow_blank=True, max_length=200)
    tourist_tax = serializers.CharField(required=False, allow_blank=True, max_length=200)

    def create(self, validated_data):
        """
        Create and return a new `Snippet` instance, given the validated data.
        """
        return Property.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Update and return an existing `Snippet` instance, given the validated data.
        """
        instance.name = validated_data.get('name', instance.name)
        instance.destitnation = validated_data.get('destitnation', instance.destitnation)
        instance.tourist_tax = validated_data.get('tourist_tax', instance.tourist_tax)
        instance.save()
        return instance
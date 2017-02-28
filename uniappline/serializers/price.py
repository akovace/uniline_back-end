from rest_framework import serializers
from uniappline.models import Property, Unit, Base_price, Discount


class Base_priceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Base_price
        fields = ('id', 'unit', 'from_date', 'to_date', 'min_nights', 'nr_persons', 'checkin_days', 'price')
    # class Meta:
    #     model = Unit
    #     fields = ('id', 'name', 'type', 'appart_name')

# class Base_priceSerializer(serializers.Serializer):
    # id = serializers.IntegerField(read_only=True)
    # unit = serializers.models.ForeignKey(Unit)
    # from_date = serializers.DateField()
    # to_date = serializers.DateField()
    # min_nights = serializers.IntegerField()
    # nr_persons = serializers.IntegerField()
    # checkin_days = serializers.CharField(max_length=7)
    # price = serializers.DecimalField(max_digits=8, decimal_places=2)




    def create(self, validated_data):
        """
        Create and return a new `Snippet` instance, given the validated data.
        """
        return Base_price.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Update and return an existing `Snippet` instance, given the validated data.
        """
        instance.unit = validated_data.get('unit', instance.unit)
        instance.from_date = validated_data.get('from_date', instance.from_date)
        instance.to_date = validated_data.get('to_date', instance.to_date)
        instance.min_nights = validated_data.get('min_nights', instance.min_nights)
        instance.nr_persons = validated_data.get('nr_persons', instance.nr_persons)
        instance.checkin_days = validated_data.get('checkin_days', instance.checkin_days)
        instance.price = validated_data.get('price', instance.price)
        instance.save()
        return instance
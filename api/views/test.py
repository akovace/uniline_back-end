import json

from rest_framework import status
from datetime import datetime, timedelta as td
from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from rest_framework.views import APIView

from api.views import JSONResponse, csrf_exempt
from uniappline.models import Base_price, Unit, Property
from rest_framework.decorators import api_view
from rest_framework.decorators import parser_classes

from uniappline.serializers import PropertySerializer
from uniappline.serializers import TestSerializer, UnitSerializer, Base_priceSerializer


@csrf_exempt
def test(request):
    """
    List all snippets, or create a new snippet.
    """
    if request.method == 'GET':

        price1 = Base_price.objects.all()
        serializer = TestSerializer(price1, many=True)

        return JSONResponse(serializer.data)

    elif request.method == 'POST':

        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        data = body['dolazak']

        date_format = "%Y-%m-%d"
        dolazak = body['dolazak']
        odlazak = body['odlazak']
        dolazak = datetime.strptime(dolazak, date_format) #objedkt datum dolaska
        odlazak = datetime.strptime(odlazak, date_format) #objekt datum odlaska

        br_osoba = body['br_osoba']

        razlika_dana = odlazak - dolazak
        br_nocenja = razlika_dana.days #broj nocenja

        dani = [] #lista dana
        for i in range(0, br_nocenja):
            dani.append(dolazak + td(days=i))

        cijene = []

        price1 = Base_price.objects.filter(nr_persons=br_osoba)
        serializer = TestSerializer(price1, many=True)

        stanje = 0 # variabla koja sluzi za id kod unit-a, ako se stanje promijeni, radi se o drugoj sobi
        stanje2 = 0
        stanje3 = 0
        for i in price1:
            stanje = i.unit.id

            if stanje > stanje3:
                cijena = 0
                for dan in dani:

                    for x in price1:
                        stanje3 = stanje
                        stanje2 = x.unit.id
                        if stanje == stanje2:
                            od = datetime.strptime(str(x.from_date), date_format)
                            do = datetime.strptime(str(x.to_date), date_format)
                            razlika = do - od
                            br_n = razlika.days  # broj dana izmedu datuma
                            for dat in range(0, br_n + 1):
                                if str((od + td(days=dat))) == str(dan):
                                    cijena = cijena + x.price
                cijene.append({"snjestaj": i.unit.property.name, "soba": i.unit.name, "cijna": cijena, "dolazak": od, "odlazak": do})

            # cijene.append({"snjestaj": i.unit.property.name, "soba": i.unit.name, "cijna": i.price, "datum": i.from_date})


        return JSONResponse(cijene)
@csrf_exempt
def test_detail(request, pk, format=None):
    """
    Retrieve, update or delete a snippet instance.
    """
    try:
        snippet = Base_price.objects.get(pk=pk)
    except Base_price.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = Base_priceSerializer(snippet)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = Base_priceSerializer(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        snippet.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# date_format = "%Y-%m-%d"
#         dolazak = '2017-08-24'
#         odlazak = '2017-08-31'
#         dolazak = datetime.strptime(dolazak, date_format) #objedkt datum dolaska
#         odlazak = datetime.strptime(odlazak, date_format) #objekt datum odlaska
#
#         br_osoba = 4
#
#         razlika_dana = odlazak - dolazak
#         br_nocenja = razlika_dana.days #broj nocenja
#
#         dani = [] #lista dana
#         for i in range(0, br_nocenja):
#             dani.append(dolazak + td(days=i))
#
#         cijene = []
#
#         price1 = Base_price.objects.filter(nr_persons=br_osoba)
#         serializer = TestSerializer(price1, many=True)
#
#         stanje = 0 # variabla koja sluzi za id kod unit-a, ako se stanje promijeni, radi se o drugoj sobi
#         stanje2 = 0
#         stanje3 = 0
#         for i in price1:
#             stanje = i.unit.id
#
#             if stanje > stanje3:
#                 cijena = 0
#                 for dan in dani:
#
#                     for x in price1:
#                         stanje3 = stanje
#                         stanje2 = x.unit.id
#                         if stanje == stanje2:
#                             od = datetime.strptime(str(x.from_date), date_format)
#                             do = datetime.strptime(str(x.to_date), date_format)
#                             razlika = do - od
#                             br_n = razlika.days  # broj dana izmedu datuma
#                             for dat in range(0, br_n + 1):
#                                 if str((od + td(days=dat))) == str(dan):
#                                     cijena = cijena + x.price
#                 cijene.append({"snjestaj": i.unit.property.name, "soba": i.unit.name, "cijna": cijena, "dolazak": od, "odlazak": do})
#
#
#
#
#
#
#             # cijene.append({"snjestaj": i.unit.property.name, "soba": i.unit.name, "cijna": i.price, "datum": i.from_date})

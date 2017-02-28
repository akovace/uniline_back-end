from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from uniappline.models import Base_price
from uniappline.serializers import Base_priceSerializer

class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)


@csrf_exempt
def price_list(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        prices = Base_price.objects.all()
        serializer = Base_priceSerializer(prices, many=True)
        return JSONResponse(serializer.data)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        # serializer = TestSerializer(data=data)
        # serializer = Base_priceSerializer(data=data)
        # if serializer.is_valid():
        #     serializer.save()
        #     return JSONResponse(serializer.data, status=201)
        # return JSONResponse(serializer.errors, status=400)
        return JSONResponse(data, status=201)


@csrf_exempt
def price_detail(request, pk):
    """
    Retrieve, update or delete a code snippet.
    """
    try:
        price = Base_price.objects.get(pk=pk)
    except Base_price.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = Base_priceSerializer(price)
        return JSONResponse(serializer.data)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = Base_priceSerializer(price, data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data)
        return JSONResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        property.delete()
        return HttpResponse(status=204)
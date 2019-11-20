import 'package:flutter/material.dart';
import '../providers/product.dart';
import "package:provider/provider.dart";
import "../providers/products.dart";

class EditProductScreen extends StatefulWidget {
  static const routeName = '/editproduct';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descioptionFocusNode = FocusNode();
  final _imageURLControler = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editProduct =
      Product(id: null, title: "", price: 0, description: "", imageUrl: "");
  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateImageURL);
    _priceFocusNode.dispose();
    _descioptionFocusNode.dispose();
    _imageURLControler.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }

  var _initValue = {
    'title': '',
    'price': '',
    'description': '',
    'imageURL': ''
  };
  var _isInit = true;
  @override
  void initState() {
    _imageFocusNode.addListener(_updateImageURL);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final id = ModalRoute.of(context).settings.arguments as String;

      if (id != null) {
        final _editProduct =
            Provider.of<Products>(context, listen: false).findById(id);
        _initValue = {
          'title': _editProduct.title,
          'price': _editProduct.price.toString(),
          'description': _editProduct.description,
          'iamgeURL': ''
        };
        _imageURLControler.text = _editProduct.imageUrl;
      }
    }
    _isInit = false;
  }

  void _updateImageURL() {
    if (!_imageFocusNode.hasFocus) {
      if (_imageURLControler.text.isEmpty ||
          !_imageURLControler.text.startsWith("htpp") &&
              !_imageURLControler.text.startsWith("htpps") ||
          _imageURLControler.text.endsWith(".png") &&
              !_imageURLControler.text.endsWith(".jpg") &&
              !_imageURLControler.text.endsWith(".jpeg")) {
        return;
      }

      setState(() {});
    }
  }  

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      Provider.of<Products>(context, listen: false).updateProduct(_editProduct.id,_editProduct);
    }
    _form.currentState.save();
    Provider.of<Products>(context, listen: false).addProduct(_editProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValue['title'],
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a titile";
                  }

                  return null;
                },
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editProduct = Product(
                      title: value,
                      price: _editProduct.price,
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl,
                      id: null);
                },
              ),
              TextFormField(
                initialValue: _initValue['price'],
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a price";
                  }
                  if (double.tryParse(value) == null) {
                    return "Please enter a valid price";
                  }
                  if (double.parse(value) <= 0) {
                    return "Please enter a number greater than zero";
                  }

                  return null;
                },
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descioptionFocusNode);
                },
                onSaved: (value) {
                  _editProduct = Product(
                      title: _editProduct.title,
                      price: double.parse(value),
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl,
                      id: null);
                },
              ),
              TextFormField(
                initialValue: _initValue['description'],
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a description";
                  }
                  if (value.length < 10) {
                    return "Please enter more information about product";
                  }

                  return null;
                },
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descioptionFocusNode,
                onSaved: (value) {
                  _editProduct = Product(
                      title: _editProduct.title,
                      price: _editProduct.price,
                      description: value,
                      imageUrl: _editProduct.imageUrl,
                      id: null);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 100,
                        height: 100,
                        child: _imageURLControler.text.isEmpty
                            ? Text("Enter your image")
                            : FittedBox(
                                child: Image.network(_imageURLControler.text),
                              )),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a image URL";
                          }
                          if (!value.startsWith("htpp") &&
                              !value.startsWith("htpps")) {
                            return "Please enter correct adress ";
                          }
                          if (!value.endsWith(".png") &&
                              !value.endsWith(".jpg") &&
                              !value.endsWith(".jpeg")) {
                            return "Dhis adress is not to image";
                          }

                          return null;
                        },
                        decoration:
                            InputDecoration(labelText: 'add the picture'),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        controller: _imageURLControler,
                        focusNode: _imageFocusNode,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          _editProduct = Product(
                              title: _editProduct.title,
                              price: _editProduct.price,
                              description: _editProduct.description,
                              imageUrl: value,
                              id: _editProduct.id);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductModel {
  final String id;
  final String image;
  final int price;
  final int wholesaleprice;
  final bool isfavourite;
  final bool isonsale;
  final bool ispopular;
  final String productname;
  final String catagoryname;
  final String serialcode;
  final String producttype;
  final String weight;
  final String description;
  final String orignal;
  const ProductModel({
    this.id,
    this.image,
    this.price,
    this.description,
    this.wholesaleprice,
    this.isfavourite,
    this.isonsale,
    this.ispopular,
    this.productname,
    this.catagoryname,
    this.serialcode,
    this.producttype,
    this.weight,
    this.orignal,
  });
}

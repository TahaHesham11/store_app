class Product
{

 int? id;
 int? price;
 String? title;
 String? subTitle;
 String? description;
 String? image;

  Product({
    required this.id, required this.price, required this.title, required this.subTitle, required this.description,
    required this.image,
  });

   Product.fromJson(Map<String, dynamic> json) {

      id= json["id"];
      price= json["price"];
      title= json["title"];
      subTitle= json["subTitle"];
      image= json["image"];
      description= json["description"];

  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "price": this.price,
      "title": this.title,
      "subTitle": this.subTitle,
      "image": this.image,
      "description": this.description,
    };
  }

}
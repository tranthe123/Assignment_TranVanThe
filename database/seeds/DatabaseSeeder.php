<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        $this->call(newcategorie::class);
    }
}
class newcategorie extends Seeder
{
	public function run()
	{
		/*DB::table('categories')->insert([
			['name'=>'Thiết kế nội thất'],
			['name'=>'Thiết kế cửa hàng'],
			['name'=>'Thiết kế Showroom'],
			['name'=>'Thiết kế nhà hàng']
        ]);*/
        /*DB::table('brands')->insert([
			['name'=>'Nội thất chung cư','id_categorie'=>'1'],
			['name'=>'Nội thất biệt thự','id_categorie'=>'1'],
			['name'=>'Nội thất nhà ở','id_categorie'=>'1'],
			['name'=>'Thiết kế kiến trúc','id_categorie'=>'1'],
			['name'=>'Cửa hàng thời trang','id_categorie'=>'2'],
			['name'=>'Cửa hàng mỹ phẩm','id_categorie'=>'2'],
			['name'=>'Cửa hàng điện thoại','id_categorie'=>'2'],
			['name'=>'Siêu thị - tạp hóa','id_categorie'=>'2'],
			['name'=>'Shop điện máy','id_categorie'=>'3'],
			['name'=>'Thiết kế nhà sách','id_categorie'=>'3'],
			['name'=>'Cửa hàng vật liệu xây dựng','id_categorie'=>'3'],
			['name'=>'Shop mỹ phẩm-Spa','id_categorie'=>'3'],
			['name'=>'Thiết kế nhà hàng','id_categorie'=>'4 '],
			['name'=>'Thiết kế quán cà phê','id_categorie'=>'4'],
			['name'=>'Cửa hàng ăn uống','id_categorie'=>'4'],
			['name'=>'Cửa hàng bánh ngọt','id_categorie'=>'3']

        ]);*/
        /*DB::table('products')->insert([
			['name'=>'Phòng ngủ','img'=>'img/cc4.jpg','id_brand'=>'1'],
			['name'=>'Phòng khách','img'=>'img/noithat4.jpg','id_brand'=>'1'],
			['name'=>'Nhà bếp','img'=>'img/cc4.jpg','id_brand'=>'1'],
			['name'=>'Nhà vệ sinh','img'=>'img/cc4.jpg','id_brand'=>'1'],
			['name'=>'Phòng ngủ','img'=>'img/cc4.jpg','id_brand'=>'1'],
			['name'=>'Phòng Khách','img'=>'img/cc4.jpg','id_brand'=>'2'],
			['name'=>'Nhà bếp','img'=>'img/cc4.jpg','id_brand'=>'4'],
			['name'=>'Nhà vệ sinh','img'=>'img/cc4.jpg','id_brand'=>'3']

        ]);*/
        /*DB::table('order')->insert([
			['name'=>'Phạm Quốc Hùng','email'=>'dungcd@gmail.com','addess'=>'Số 15 Hùng Vương','phone'=>'0125485471'],
			['name'=>'Phạm Quốc Hùng','email'=>'dungpahm@gmail.com','addess'=>'Số 15 Hùng Vương','phone'=>'0125485471'],
			['name'=>'Phạm Quốc Hùng','email'=>'dungtroc@gmail.com','addsess'=>'Số 15 Hùng Vương','phone'=>'0125485471']

        ]);*/
	}

}

import 'package:flutter/material.dart';
import 'package:pos/components/button/full_width_button.dart';
import 'package:pos/components/form/form_group_with_title.dart';
import 'package:pos/components/input/custom_text_form_field.dart';
import 'package:pos/components/input/date_picker_action_button.dart';
import 'package:pos/components/input/dropdown_action_button.dart';
import 'package:pos/components/scaffold/main_appbar.dart';
import 'package:pos/components/scaffold/main_scaffold.dart';
import 'package:pos/components/scaffold/position_bottom_component.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/models/provinces.dart';

class CreateCustomer extends StatefulWidget {
  const CreateCustomer({super.key});

  @override
  State<CreateCustomer> createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {
  bool _isAddShipAddress = false;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffoldColor: MainColors.kDefaultBackground,
      appBar: mainAppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: BackButton(
              color: MainColors.kDefaultBlack,
            ),
          ),
          title: Text(
            'Tạo khách hàng mới',
            style: TextStyle(
              fontSize: 18,
              color: MainColors.kDefaultBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Hủy",
                    style: TextStyle(color: MainColors.kDefaultLink),
                  )),
            ),
          ]),
      body: Stack(children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: [
                  const FormGroupWithTitle(
                    title: "Thông tin chung",
                    haveDivider: true,
                    children: [
                      CustomTextFormField(
                        label: "Tên khách hàng",
                        required: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        label: "Số điện thoại",
                        required: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        label: "Nhóm khách hàng",
                        required: false,
                      ),
                    ],
                  ),
                  FormGroupWithTitle(
                    title: "Địa chỉ",
                    children: [
                      DropDownActionButton(
                        label: "Tỉnh/ Thành phố",
                        modalLabel: "Chọn Tỉnh/ Thành phố",
                        data: provinces,
                        canSearch: true,
                      ),
                      const SizedBox(height: 16),
                      DropDownActionButton(
                        label: "Quận/ Huyện",
                        modalLabel: "Chọn Quận/ Huyện",
                        data: provinces,
                        canSearch: true,
                      ),
                      const SizedBox(height: 16),
                      DropDownActionButton(
                        label: "Phường/ Xã",
                        modalLabel: "Chọn Phường/ Xã",
                        data: provinces,
                        canSearch: true,
                      ),
                      const SizedBox(height: 16),
                      const CustomTextFormField(
                          label: "Địa chỉ cụ thể", required: false),
                      !_isAddShipAddress
                          ? DeliveryAddressLink(
                              type: AddressLink.add,
                              onPressed: () {
                                setState(() {
                                  _isAddShipAddress = true;
                                });
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                  _isAddShipAddress
                      ? FormGroupWithTitle(
                          title: "Địa chỉ giao hàng",
                          children: [
                            DropDownActionButton(
                              label: "Tỉnh/ Thành phố",
                              modalLabel: "Chọn Tỉnh/ Thành phố",
                              data: provinces,
                              canSearch: true,
                            ),
                            const SizedBox(height: 16),
                            DropDownActionButton(
                              label: "Quận/ Huyện",
                              modalLabel: "Chọn Quận/ Huyện",
                              data: provinces,
                              canSearch: true,
                            ),
                            const SizedBox(height: 16),
                            DropDownActionButton(
                              label: "Phường/ Xã",
                              modalLabel: "Chọn Phường/ Xã",
                              data: provinces,
                              canSearch: true,
                            ),
                            const SizedBox(height: 16),
                            const CustomTextFormField(
                                label: "Địa chỉ cụ thể", required: false),
                            DeliveryAddressLink(
                              type: AddressLink.delete,
                              onPressed: () {
                                setState(() {
                                  _isAddShipAddress = false;
                                });
                              },
                            ),
                          ],
                        )
                      : const SizedBox(),
                  FormGroupWithTitle(
                    title: "Thông tin bổ sung",
                    children: [
                      const DatePickerActionButton(
                        label: "Ngày sinh",
                        modalLabel: "Chọn ngày sinh",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DropDownActionButton(
                        label: "Giới tính",
                        modalLabel: "Chọn Giới tính",
                        data: provinces,
                        canSearch: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const CustomTextFormField(
                          label: "Công ty", required: false),
                      const SizedBox(
                        height: 16,
                      ),
                      const CustomTextFormField(
                          label: "Mã số thuế", required: false),
                      const SizedBox(
                        height: 16,
                      ),
                      const CustomTextFormField(
                          label: "Hạn mức công nợ", required: false),
                      const SizedBox(
                        height: 16,
                      ),
                      const CustomTextFormField(
                          label: "Ghi chú", required: false),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
        PositionedBottom(
          children: [
            SizedBox(
              width: screenSize(context).width,
              child: FullWidthButton(
                title: 'Tạo mới',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

enum AddressLink { delete, add }

class DeliveryAddressLink extends StatelessWidget {
  final Function onPressed;
  final AddressLink type;

  const DeliveryAddressLink({
    Key? key,
    required this.onPressed,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: screenSize(context).width,
      child: TextButton(
        onPressed: () => onPressed(),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            type == AddressLink.add
                ? "+ Thêm địa chỉ giao hàng"
                : "x Xóa địa chỉ giao hàng",
            style: TextStyle(
              color: type == AddressLink.add
                  ? MainColors.kDefaultLink
                  : MainColors.kDanger600,
            ),
          ),
        ),
      ),
    );
  }
}

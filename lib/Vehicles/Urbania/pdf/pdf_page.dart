import 'package:flutter/material.dart';
import 'package:sp_quotation/Vehicles/Urbania/pdf/pdfpage.dart';
import 'userDetails.dart' as user;
import 'model_info.dart' as model;

class pdfPage extends StatefulWidget {
  const pdfPage({Key? key}) : super(key: key);

  @override
  State<pdfPage> createState() => _pdfPageState();
}
DateTime now = DateTime.now();

class _pdfPageState extends State<pdfPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            //constant column for company details
            Column(
              children: [
                Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/logo.png'),
                      height: 80,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: const [
                        Text(
                          'S.P Automotive',
                          style: TextStyle(
                            fontSize: 25,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Authorised Dealers For Force Motors Ltd.',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'C/O.Richirich Compound,Nr.Vatika Hotel,Ghodbunder Road,Versova,Mira Road,Thane 401107',
                  style: TextStyle(
                    fontSize: 8,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  'spforcesale@yahoo.in',
                  style: TextStyle(
                    fontSize: 8,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            const SizedBox(
              height: 15,
            ),
            //Column for Customer details
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text(
                      'Quotation : SP/Urbania/Mar/09}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Date: ${now.day}/${now.month}/${now.year}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name : ${user.name}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Email: ${user.email}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                  ],
                ),
                Text(
                  'Location : ${user.location}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                ),
                Text(
                  'Contact: ${user.contactNo}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            const SizedBox(
              height: 15,
            ),
            //Column for Bills Details
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        '${model.model}',
                        style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Qty',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Amount(Rs)',
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        'Ex Showroom Model',
                        style: TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${model.price}',
                        style: const TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Insurance and Registration',
                        style: TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                (model.insuranceType == 'Dealer')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Comprehensive Insurance for one year',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.insurance}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        'CRTEMP',
                        style: TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${model.crtemp}',
                        style: const TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                (model.registrationType == 'Commercial')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'SpeedLock',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.speedLock}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                (model.registrationExpense == 'Dealer')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'RTO Tax (MH passing under Transport category Yellow Number plate)',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.rtoTax}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                (model.registrationExpense == 'Dealer')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'RTO Receipts',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.rtoReceipts}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                (model.registrationType == 'Commercial')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Radium Strips',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.radiumStrips}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                (model.registrationType == 'Commercial')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'GPRS Activation',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.gprsActivation}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                (model.registrationType == 'Commercial')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Fastag',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.fastTag}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                (model.registrationType == 'Commercial')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Facilitating Charges',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.facilitatingCharges}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                (model.registrationType == 'Private')
                    ? Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'HSRP(Applicable only if Registration done by Customer)',
                              style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${model.hsrp}',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        'Total charges',
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${model.totalCharges}',
                        style: const TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        (model.other!=null)?(model.other!):'none',
                        style: const TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        (model.otherCharges!=0)?'${model.otherCharges}':'0',
                        style: const TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${model.finalAmt}',
                        style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),

            //Row for E.&.O.E Shit
            Row(
              children: const [
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'E.&.O.E for S.P Automotive',
                    style: TextStyle(
                      fontSize: 10,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            //Row for sign image and some t&c
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '1. Prices prevailing at the time of delivery will be applicable.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 7,
                        ),
                      ),
                      Text(
                        '2. Delivery on confirmation of availability of stock from H.O.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 7,
                        ),
                      ),
                      Text(
                        '3. We are not responsible for any cash transaction against quotation.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 7,
                        ),
                      ),
                      Text(
                        '4. Demand Draft/Cheque should be in favour of M/s. S. P. Automotive ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 7,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    height: 55,
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  '5. RTGS Details - Account No. 37597435325 Bank: State Bank Of India ,IFSC Code:- SBIN0016719, Nancy Colony,Borivali',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 7,
                  ),
                ),
                Text(
                  '6. Booking cancellation charges is Rs.10000/-, Odd model booking cancellation charges is Rs. 25000/-',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 7,
                  ),
                ),
                Text(
                  '7. Hypothecation Charges Rs. 3000/- extra.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 7,
                  ),
                ),
                Text(
                  '8. For ODD models minimum delivery period will be 60 days against full payment.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 7,
                  ),
                ),
                Text(
                  '9. Odd model booking cannot be cancelled for any reason.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 7,
                  ),
                ),
                Text(
                  '10. If vehicle delivery is delayed for any reason Company will not be liabile for any compensation/penalty.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 7,
                  ),
                ),
                Text(
                  '11. Fabrication if any will have additional charges with local tax as applicable',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 7,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '"I/we hereby certify that my/ our Registration Certificate under the Mahrashtra Value Added Tax Act, 2002 is in force on the date on which the sales of the good Specified in this Tax Invoice is made by me /us and that the transaction of sale Covered by this Tax inovoice has been effected by me/us and it shall be accounted for in the turnover of sales while filing of return and the due tax, if any payable on the sale has been paid or shall be paid"',
              style: TextStyle(
                fontSize: 8,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'GST No :- 27ANVPS9324F1ZA                                        ',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 10,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Our MOTTO is Customer Satisfaction',
              style: TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const pdfPage2()));
              },
              child: const Text('yo'),
            )
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

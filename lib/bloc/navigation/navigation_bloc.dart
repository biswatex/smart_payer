import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_payer/pages/account.dart';
import 'package:smart_payer/pages/homepage.dart';
import 'package:smart_payer/pages/moneytransferpage.dart';
import 'package:smart_payer/pages/utilitybillpage.dart';
import 'package:smart_payer/pages/rechargepage.dart';
import 'package:smart_payer/pages/settingspage.dart';
import 'package:smart_payer/pages/reportpage.dart';

enum NavigationEvents {
  AccountClickEvent,
  HomePageClickEvent,
  UtilityBillClickEvent,
  RechargeClickEvent,
  ReportClickEvent,
  MoneyTransferClickEvent,
  ChangePasswordClickEvent,
  LogoutClickEvent
}

abstract class NavigationStates{

}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>
{
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {

    switch(event)
    {

      case NavigationEvents.AccountClickEvent:
        yield AccountPage();
        break;
      case NavigationEvents.HomePageClickEvent:
        yield HomePage();
        break;
      case NavigationEvents.UtilityBillClickEvent:
        yield UtilityBill();
        break;
      case NavigationEvents.RechargeClickEvent:
        yield MyRecharge();
        break;
      case NavigationEvents.ReportClickEvent:
        yield Reports();
        break;
      case NavigationEvents.MoneyTransferClickEvent:
        yield MoneyTransfer();
        break;
      case NavigationEvents.ChangePasswordClickEvent:
        yield ChangePassword();
        break;
      case NavigationEvents.LogoutClickEvent:
        yield HomePage();
        break;

    }

  }

}
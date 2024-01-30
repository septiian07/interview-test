import 'package:interview_task/src/app/app.locator.dart';
import 'package:interview_task/src/enum/dialog_type.dart';
import 'package:interview_task/src/ui/widgets/confirmation_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialog() {
  var dialogService = locator<DialogService>();

  final builders = {
    DialogType.confirmation: (context, sheetRequest, completer) =>
        ConfirmationDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

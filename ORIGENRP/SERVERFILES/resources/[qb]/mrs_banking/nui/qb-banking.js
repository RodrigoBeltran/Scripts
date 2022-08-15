var Config = new Object();
Config.closeKeys = [69];
Config.ATMTransLimit = 5000;
var currentLimit = null;
var clientPin = null;
var click = document.getElementById("click");
var over_button = document.getElementById("over_button");
var bankon = document.getElementById("bankon");
var cargado = document.getElementById("cargado");
over_button.volume = 0.2;
click.volume = 0.2;
bankon.volume = 0.2;
cargado.volume = 0.4;
window.addEventListener("message", function(event) {
    if (event.data.status == "openbank") {
        /*$("#cardDetails").css({"display":"none"});*/
        $("#createNewPin").css({ "display": "none" });
        $("#successMessageATM").removeClass('alert-danger').addClass('alert-success');
        $("#successRowATM").css({ "display": "none" });
        $("#successMessageATM").html('');
        $("#withdrawATMError").css({ "display": "none" });
        $("#withdrawATMErrorMsg").html('');
        $("#savingsStatement").DataTable().destroy();
        $("#currentStatement").DataTable().destroy();
        $("#currentStatementATM").DataTable().destroy();
        $("#accountName").html(event.data.information.name)
        $("#accountNumber").html(event.data.information.accountinfo);
        $("#accountSortCode").html(event.data.information.accountinfo.sort_code);

        $('#newPinNumber').val('');
        $("#bankingHome-tab").addClass('active');
        $("#bankingWithdraw-tab").removeClass('active');
        $("#bankingDeposit-tab").removeClass('active');
        $("#bankingTransfer-tab").removeClass('active');
        $("#bankingStatement-tab").removeClass('active');
        $("#bankingActions-tab").removeClass('active');
        $("#bankingSavings-tab").removeClass('active');
        $("#bankingHome").addClass('active').addClass('show');
        $("#bankingWithdraw").removeClass('active').removeClass('show');
        $("#bankingSavings").removeClass('active').removeClass('show');
        $("#bankingDeposit").removeClass('active').removeClass('show');
        $("#bankingTransfer").removeClass('active').removeClass('show');
        $("#bankingStatement").removeClass('active').removeClass('show');
        $("#bankingActions").removeClass('active').removeClass('show');

        $("#savingsStatementContents").html('');
        $("#savingsBalance").html('');
        $("#accountName2").html('');
        $("#saccountNumber").html('');
        $("#saccountSortCode").html('');
        $("#savingAccountCreator").css({ "display": "block" });
        $("#savingsQuicky1").css({ "display": "none" });
        $("#bankingSavings-tab").css({ "display": "none" });
        $("#savingsQuicky2").css({ "display": "none" });
        if (event.data.information.savings !== undefined && event.data.information.savings !== null) {
            setupSavingsMenu(event.data.information.savings, event.data.information.name);
        } else {
            enableSavingsCreator();
        }
        if (event.data.information.cardInformation !== undefined && event.data.information.cardInformation !== null) {
            $('#cardType').html(event.data.information.cardInformation.type)
            var str = "" + event.data.information.cardInformation.cardNumber + "";
            var res = str.slice(12);
            var cardNumber = "************" + res;
            $('#cardNumberShow').html(cardNumber)
        }
        populateBanking(event.data.information);
        //$("#bankingContainer").css({"display":"block"});
        $(".logo-animado").html();
        $(".logo-animado").html('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="eqMb6uN1xaP1" viewBox="0 0 409.28 226.39" shape-rendering="geometricPrecision" text-rendering="geometricPrecision"><style><![CDATA[#eqMb6uN1xaP2 {animation: eqMb6uN1xaP2_c_o 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP2_c_o { 0% {opacity: 0;animation-timing-function: cubic-bezier(0.6,0.04,0.98,0.335)} 16.666667% {opacity: 1} 100% {opacity: 1}} #eqMb6uN1xaP4_to {animation: eqMb6uN1xaP4_to__to 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP4_to__to { 0% {transform: translate(-82.92px,-301.25px)} 9.666667% {transform: translate(-82.92px,-301.25px);animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 10% {transform: translate(-82.92px,-271.25px);animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 20% {transform: translate(-82.92px,-301.25px)} 100% {transform: translate(-82.92px,-301.25px)}} #eqMb6uN1xaP4 {animation: eqMb6uN1xaP4_c_o 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP4_c_o { 0% {opacity: 0} 10% {opacity: 0;animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 20% {opacity: 1} 100% {opacity: 1}} #eqMb6uN1xaP5_to {animation: eqMb6uN1xaP5_to__to 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP5_to__to { 0% {transform: translate(-82.92px,-301.25px)} 12.666667% {transform: translate(-82.92px,-301.25px);animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 13.333333% {transform: translate(-82.92px,-271.25px);animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 23.333333% {transform: translate(-82.92px,-301.25px)} 100% {transform: translate(-82.92px,-301.25px)}} #eqMb6uN1xaP5 {animation: eqMb6uN1xaP5_c_o 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP5_c_o { 0% {opacity: 0} 13.333333% {opacity: 0;animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 23.333333% {opacity: 1} 100% {opacity: 1}} #eqMb6uN1xaP6_to {animation: eqMb6uN1xaP6_to__to 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP6_to__to { 0% {transform: translate(-82.92px,-271.25px)} 18.666667% {transform: translate(-82.92px,-271.25px);animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 30% {transform: translate(-82.92px,-301.25px)} 100% {transform: translate(-82.92px,-301.25px)}} #eqMb6uN1xaP6 {animation: eqMb6uN1xaP6_c_o 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP6_c_o { 0% {opacity: 0} 18.666667% {opacity: 0;animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 30% {opacity: 1} 100% {opacity: 1}} #eqMb6uN1xaP7_to {animation: eqMb6uN1xaP7_to__to 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP7_to__to { 0% {transform: translate(-82.92px,-271.25px)} 23.333333% {transform: translate(-82.92px,-271.25px);animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 36.666667% {transform: translate(-82.92px,-301.25px)} 100% {transform: translate(-82.92px,-301.25px)}} #eqMb6uN1xaP7 {animation: eqMb6uN1xaP7_c_o 3000ms linear 1 normal forwards}@keyframes eqMb6uN1xaP7_c_o { 0% {opacity: 0} 23.333333% {opacity: 0;animation-timing-function: cubic-bezier(0.42,0,0.58,1)} 36.666667% {opacity: 1} 100% {opacity: 1}}]]></style><text id="eqMb6uN1xaP2" dx="0" dy="0" font-family="&quot;bankgothic&quot;" font-size="147.57" transform="matrix(1 0 0 1 -0.000625 149.15125)" opacity="0" fill="rgb(255,255,255)" stroke="none" stroke-width="1" stroke-miterlimit="1"><tspan id="eqMb6uN1xaP3" x="0" y="0" font-family="bankgothic" font-size="147.57" stroke="none" stroke-width="0" stroke-miterlimit="1"><![CDATA[Origen]]></tspan></text><g id="eqMb6uN1xaP4_to" transform="translate(-82.92,-301.25)"><path id="eqMb6uN1xaP4" d="M118.35,526.77C117.674919,526.167987,117.307496,525.29352,117.35,524.39L117.35,465.71C117.319074,464.838032,117.651202,463.992296,118.267215,463.374387C118.883229,462.756477,119.727941,462.421753,120.6,462.45L140.89,462.45C144.035969,462.404573,147.144533,463.136202,149.94,464.58C152.571602,465.932833,154.792105,467.966856,156.37,470.47C157.964214,472.989667,158.791135,475.918633,158.75,478.9C158.788942,481.724895,157.95804,484.493405,156.37,486.83C154.769713,489.177779,152.565578,491.050257,149.99,492.25C153.553423,493.136244,156.739144,495.1409,159.08,497.97C161.376605,500.934864,162.558751,504.61226,162.42,508.36C162.485902,511.867288,161.590182,515.325668,159.83,518.36C158.132838,521.25646,155.664396,523.624502,152.7,525.2C149.500754,526.887348,145.926326,527.737092,142.31,527.67L121,527.67C120.036293,527.704404,119.093431,527.384187,118.35,526.77ZM140.89,489.67C143.921252,489.793694,146.886854,488.764666,149.19,486.79C151.378102,484.76614,152.557221,481.876932,152.41,478.9C152.565829,476.037164,151.392493,473.262482,149.23,471.38C146.86289,469.513485,143.901003,468.565254,140.89,468.71L123.89,468.71L123.89,489.71ZM142.31,521.38C145.942148,521.534761,149.491056,520.264474,152.2,517.84C154.774063,515.375561,156.159185,511.920045,156,508.36C156.14614,504.927628,154.752741,501.60914,152.2,499.31C149.447905,496.975798,145.915054,495.768413,142.31,495.93L123.86,495.93L123.86,521.38Z" transform="translate(0,0)" opacity="0" fill="rgb(255,255,255)" stroke="none" stroke-width="1" stroke-miterlimit="1"/></g><g id="eqMb6uN1xaP5_to" transform="translate(-82.92,-301.25)"><path id="eqMb6uN1xaP5" d="M263.18,524.39C263.152575,525.949486,262.040176,527.278222,260.509818,527.579474C258.979459,527.880725,257.446446,527.07274,256.83,525.64L251.24,512.12L218.93,512.12L213.34,525.64C212.949042,526.939854,211.690233,527.77906,210.34,527.64C209.464095,527.658496,208.623871,527.293181,208.04,526.64C207.462663,526.014495,207.147637,525.19113,207.16,524.34C207.147922,523.85381,207.23644,523.370369,207.42,522.92L232,464.71C232.430058,463.330856,233.726001,462.406935,235.17,462.45C236.598818,462.397721,237.876907,463.332505,238.26,464.71L262.88,523.05C263.094241,523.463192,263.197609,523.924902,263.18,524.39ZM221.27,506.53L249,506.53L235.15,473.05Z" transform="translate(0,0)" opacity="0" fill="rgb(255,255,255)" stroke="none" stroke-width="1" stroke-miterlimit="1"/></g><g id="eqMb6uN1xaP6_to" transform="translate(-82.92,-271.25)"><path id="eqMb6uN1xaP6" d="M313.59,526.73C312.973882,526.110168,312.640992,525.263471,312.67,524.39L312.67,465.71C312.670955,464.339149,313.529409,463.115349,314.818053,462.647768C316.106697,462.180187,317.550186,462.568733,318.43,463.62L358.33,516L358.33,465.71C358.311776,464.822577,358.676053,463.970171,359.33,463.37C360.634389,462.145708,362.665611,462.145708,363.97,463.37C364.583481,463.990852,364.912848,464.837798,364.88,465.71L364.88,524.39C364.894968,525.247243,364.567441,526.075058,363.97,526.69C363.367557,527.340731,362.516669,527.704358,361.63,527.69C360.689447,527.767681,359.775118,527.355855,359.21,526.6L319.21,474.18L319.21,524.43C319.224968,525.287243,318.897441,526.115058,318.3,526.73C317.698308,527.381795,316.846919,527.745637,315.96,527.73C315.064179,527.746576,314.20318,527.383285,313.59,526.73Z" transform="translate(0,0)" opacity="0" fill="rgb(255,255,255)" stroke="none" stroke-width="1" stroke-miterlimit="1"/></g><g id="eqMb6uN1xaP7_to" transform="translate(-82.92,-271.25)"><path id="eqMb6uN1xaP7" d="M422.57,526.69C421.931669,526.095513,421.569396,525.262285,421.57,524.39L421.57,465.71C421.503132,464.504049,422.108492,463.359958,423.143152,462.736848C424.177813,462.113737,425.472187,462.113737,426.506848,462.736848C427.541508,463.359958,428.146868,464.504049,428.08,465.71L428.08,494.09L458.54,463.62C459.207046,462.892277,460.143008,462.469467,461.13,462.45C461.928085,462.398276,462.710597,462.687856,463.282748,463.246657C463.854899,463.805458,464.162871,464.580917,464.13,465.38C464.127364,466.377815,463.736431,467.33542,463.04,468.05L440.17,490.92L463.29,522.47C463.696122,523.060818,463.928259,523.753765,463.96,524.47C463.96727,525.29642,463.651507,526.093005,463.08,526.69C462.55701,527.321761,461.780144,527.688207,460.96,527.69C459.85131,527.748709,458.796825,527.206184,458.2,526.27L435.5,495.55L428.12,503L428.12,524.37C428.131193,525.228467,427.800152,526.05607,427.2,526.67C426.586533,527.284935,425.753612,527.630525,424.885,527.630525C424.016388,527.630525,423.183467,527.284935,422.57,526.67Z" transform="translate(0,0)" opacity="0" fill="rgb(255,255,255)" stroke="none" stroke-width="1" stroke-miterlimit="1"/></g></svg>');
        $("#bankingContainer").fadeIn(300);
        bankon.play();
        setTimeout(function() {
            $(".logo-animado").fadeOut(300, function() {
                $(".appBanco").fadeIn(300);
                cargado.play();
            });
        }, 2000)

    } else if (event.data.status == "updateCard") {
        $('#cardType').html(event.data.cardtype)
        var str = "" + event.data.number + "";
        var res = str.slice(12);
        var cardNumber = "************" + res;
        $('#cardNumberShow').html(cardNumber)
    } else if (event.data.status == "closebank") {
        $("#cardDetails").css({ "display": "none" });
        $("#createNewPin").css({ "display": "none" });
        $("#bankingHomeATM, #bankingWithdrawATM, #bankingStatementATM").removeClass('show').removeClass('active');
        $("#bankingHomeATM, #bankingWithdrawATM, #bankingStatementATM").removeClass('show').removeClass('active');
        $("#withdrawATMErrorMsg").removeClass('alert-success').addClass('alert-danger');
        $("#successMessageATM").removeClass('alert-danger').addClass('alert-success');
        $("#successRowATM").css({ "display": "none" });
        $("#successMessageATM").html('');
        $("#withdrawATMError").css({ "display": "none" });
        $("#withdrawATMErrorMsg").html('');
        $("#savingsStatement").DataTable().destroy();
        $("#currentStatement").DataTable().destroy();
        $("#currentStatementATM").DataTable().destroy();
        $("#enteringPin").addClass('show').addClass('active');
        $("#bankingHomeATM-tab, #bankingWithdrawATM-tab, #bankingTransferATM-tab, #bankingStatementATM-tab").addClass('disabled').removeClass('active');
        $("#bankingHomeATM-tab").addClass('active');
        $("#createNewPin").css({ "display": "block" });
        $("#successRow").css({ "display": "none" });
        $("#successMessage").html('');
        $("#bankingContainer").fadeOut(300, function() {
            $(".logo-animado").fadeIn();

        });
        $(".appBanco").fadeOut(300);
        $("#savingsQuicky").css({ "display": "none" });
        $("#savingAccountCreator").css({ "display": "none" });
        $("#ATMContainer").fadeOut(300);
    } else if (event.data.status == "transferError") {
        if (event.data.error !== undefined) {
            $("#transferError").css({ "display": "block" });
            $("#transferErrorMsg").html(event.data.error);
        }
    } else if (event.data.status == "successMessage") {
        if (event.data.message !== undefined) {
            $("#successRow").css({ "display": "block" });
            $("#successMessage").html(event.data.message);
        }
    }
});

function dynamicSort(property) {
    var sortOrder = 1;
    if (property[0] === "-") {
        sortOrder = -1;
        property = property.substr(1);
    }
    return function(a, b) {
        var result = (a[property] < b[property]) ? -1 : (a[property] > b[property]) ? 1 : 0;
        return result * sortOrder;
    }
}

function setupSavingsMenu(data, name) {
    statement2 = data.statement
    $("#savingsStatementContents").html('');
    $("#savingsBalance").html(data.amount);
    $("#accountName2").html(name);
    $("#saccountNumber").html(data.details.account);
    $("#saccountSortCode").html(data.details.sortcode);
    $("#savingAccountCreator").css({ "display": "none" });
    $("#savingsQuicky1").css({ "display": "block" });
    $("#bankingSavings-tab").css({ "display": "block" });
    $("#savingsQuicky2").css({ "display": "block" });
    if (statement2 !== undefined) {
        statement2.sort(dynamicSort("date"));
        $.each(statement2, function(index, statement) {
            console.log(index)
            if (statement.deposited == null && statement.deposited == undefined) {
                deposit = "0"
            } else {
                deposit = statement.deposited
            }
            if (statement.withdraw == null && statement.withdraw == undefined) {
                withdraw = "0"
            } else {
                withdraw = statement.withdraw
            }
            if (statement.balance == 0) {
                balance = '<span class="text-dark">$' + statement.balance + '</span>';
            } else if (statement.balance > 0) {
                balance = '<span class="text-success">$' + statement.balance + '</span>';
            } else {
                balance = '<span class="text-danger">$' + statement.balance + '</span>';
            }
            $("#savingsStatementContents").append('<tr class="statement"><td><small>' + statement.date + '</small></td><td><small>' + statement.type + '</small></td><td class="text-center text-danger"><small>$' + withdraw + '</small></td><td class="text-center text-success"><small>$' + deposit + '</small></td><td class="text-center"><small>' + balance + '</small></td></tr>');

        });

        $(document).ready(function() {
            $('#savingsStatement').DataTable({
                "order": [
                    [0, "desc"]
                ],
                "pagingType": "simple",
                "language": { "url": "spanish.json" }
            });
        });

    }

}

function enableSavingsCreator() {
    $("#savingAccountCreator").css({ "display": "block" });
}

function populateBanking(data) {
    $('#newPinNumber').val('');
    $("#createNewPin").css({ "display": "none" });
    $("#cardInactive").css({ "display": "none" });
    $("#cardOrdering").css({ "display": "none" });
    $('#withdrawAmount').val('');
    $("#customerName").html(data.name);
    $("#currentBalance").html(data.bankbalance);
    $("#currentCashBalance").html(data.cash);
    $("#currentCoins").html(data.coins);
    $("#currentBalance1").html(data.bankbalance);
    $("#currentCashBalance1").html(data.cash);
    $("#currentBalance2").html(data.bankbalance);
    $("#currentCashBalance2").html(data.cash);
    $("#currentStatementContents").html('');
    if (data.cardInformation !== undefined) {
        if (data.cardInformation.cardLocked == true) {
            $("#debitCardStatus").removeClass('bg-success');
            $("#debitCardStatus").addClass('bg-danger');
            $("#debitCardStatus").html('<div class="card-header">Tarjeta bloqueada</div><div class="card-body">Tu tarjeta está actualmente bloqueada</div><div class="card-footer"><button class="btn btn-primary btn-block" id="unLockCard">Desbloquear tarjeta</button></div>');
        } else {
            $("#debitCardStatus").removeClass('bg-danger');
            $("#debitCardStatus").addClass('bg-success');
            $("#debitCardStatus").html('<div class="card-header">Tarjeta desbloqueada</div><div class="card-body">Tu tarjeta está activa.</div><div class="card-footer"><button class="btn btn-primary btn-block" id="lockCard">Bloquear tarjeta</button></div>');
        }
        $("#cardDetails").css({ "display": "block" });
    } else {
        $("#cardOrdering").css({ "display": "none" });
        $("#cardInactive").css({ "display": "block" });
    }

    if (data.statement !== undefined) {
        data.statement.sort(dynamicSort("date"));
        $.each(data.statement, function(index, statement) {
            if (statement.deposited == null && statement.deposited == undefined) {
                deposit = "0"
            } else {
                deposit = statement.deposited
            }
            if (statement.withdraw == null && statement.withdraw == undefined) {
                withdraw = "0"
            } else {
                withdraw = statement.withdraw
            }
            if (statement.balance == 0) {
                balance = '<span class="text-dark">$' + statement.balance + '</span>';
            } else if (statement.balance > 0) {
                balance = '<span class="text-success">$' + statement.balance + '</span>';
            } else {
                balance = '<span class="text-danger">$' + statement.balance + '</span>';
            }
            $("#currentStatementContents").append('<tr class="statement"><td><small>' + statement.date + '</small></td><td><small>' + statement.type + '</small></td><td class="text-center text-danger"><small>$' + withdraw + '</small></td><td class="text-center text-success"><small>$' + deposit + '</small></td><td class="text-center"><small>' + balance + '</small></td></tr>');

        });

        $(document).ready(function() {
            $('#currentStatement').DataTable({
                "order": [
                    [0, "desc"]
                ],
                "pagingType": "simple",
                "lengthMenu": [
                    [20, 35, 50, -1],
                    [20, 35, 50, "All"]
                ],
                "lenguage": { "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Spanish.json" }

            });
        });
    }
}

function pad(n, width, z) {
    z = z || '0';
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

function closeBanking() {
    $.post("https://qb-banking/NUIFocusOff", JSON.stringify({}));
};

$(function() {
    $("body").on("keydown", function(key) {
        if (Config.closeKeys.includes(key.which)) {
            closeBanking();
        }
    });

    $(document).on('click', '#lockCard', function() {
        $("#debitCardStatus").removeClass('bg-success');
        $("#debitCardStatus").addClass('bg-danger');
        $("#debitCardStatus").html('<div class="card-header">Tarjeta bloqueada</div><div class="card-body">Tu tarjeta esta actualmente bloqueada.</div><div class="card-footer"><button class="btn btn-primary btn-block" id="unLockCard">Desbloquear tarjeta</button></div>');
        $.post('https://qb-banking/lockCard', JSON.stringify({}));
    });

    $(document).on('click', '#unLockCard', function() {
        $("#debitCardStatus").removeClass('bg-danger');
        $("#debitCardStatus").addClass('bg-success');
        $("#debitCardStatus").html('<div class="card-header">Tarjeta desbloqueada</div><div class="card-body">Tu tarjeta está activa.</div><div class="card-footer"><button class="btn btn-primary btn-block" id="lockCard">Bloquear tarjeta.</button></div>');
        $.post('https://qb-banking/unLockCard', JSON.stringify({}));
    });

    $("#openSavings").click(function() {
        $.post('https://qb-banking/createSavingsAccount', JSON.stringify({}));
    });

    $("#changePin").click(function() {
        $("#createNewPin").css({ "display": "block" });
    });

    $("#updateNewPin").click(function() {
        var newPin = $('#newPinNumber').val();

        if (newPin !== null && newPin !== undefined && newPin.replace(/[^0-9]/g, "").length === 4) {
            $("#newPinReqMsgDiv").css({ "display": "none" });
            $("#newPinReqMsg").html('')
            $.post('https://qb-banking/updatePin', JSON.stringify({
                pin: pad(newPin, 4)
            }));
            $('#newPinNumber').val('');
        } else {
            $("#newPinReqMsgDiv").css({ "display": "block" });
            $("#newPinReqMsg").html('Es necesario especificar un PIN de 4 dígitos.')
        }

    });

    $("#initiateWithdraw").click(function() {
        var amount = $('#withdrawAmount').val();

        if (amount !== undefined && amount > 0) {
            $("#withdrawError").css({ "display": "none" });
            $("#withdrawErrorMsg").html('');
            $.post('https://qb-banking/doWithdraw', JSON.stringify({
                amount: parseInt(amount)
            }));
            $('#withdrawAmount').val('')
        } else {
            // Error doing withdraw
            $("#withdrawError").css({ "display": "block" });
            $("#withdrawErrorMsg").html('Hubo un error al procesar su retiro, no has escrito la cantidad o no es un número positivo');
        }
    });

    $("#initiateWithdrawATM").click(function() {
        var amount = $('#withdrawAmountATM').val();
        if (currentLimit + parseInt(amount) <= Config.ATMTransLimit) {
            if (amount !== undefined && amount > 0) {
                $("#withdrawATMError").css({ "display": "none" });
                $("#withdrawATMErrorMsg").html('');
                $.post('https://qb-banking/doATMWithdraw', JSON.stringify({
                    amount: parseInt(amount)
                }));
                $('#withdrawAmountATM').val('');
                $("#withdrawATMErrorMsg").removeClass('alert-danger').addClass('alert-success');
                $("#withdrawATMError").css({ "display": "none" });
                $("#withdrawATMErrorMsg").html('Has retirado correctamente ' + amount + '$ de tu cuenta.');
                currentLimit = currentLimit + parseInt(amount);
            } else {
                // Error doing withdraw
                $("#withdrawATMErrorMsg").removeClass('alert-success').addClass('alert-danger');
                $("#withdrawATMError").css({ "display": "block" });
                $("#withdrawATMErrorMsg").html('    ');
            }
        } else {
            $("#withdrawATMErrorMsg").removeClass('alert-success').addClass('alert-danger');
            $("#withdrawATMError").css({ "display": "block" });
            $("#withdrawATMErrorMsg").html('Lo sentimos, ha alcanzado el límite de retiro diario de $' + Config.ATMTransLimit + ', utilice una sucursal si necesita dinero antes.');
        }
    });

    $("#initiateDeposit").click(function() {
        var amount = $('#depositAmount').val();

        if (amount !== undefined && amount > 0) {
            $("#depositError").css({ "display": "none" });
            $("#depositErrorMsg").html('');
            $.post('https://qb-banking/doDeposit', JSON.stringify({
                amount: parseInt(amount)
            }));
            $('#depositAmount').val('');
        } else {
            // Error doing withdraw
            $("#depositError").css({ "display": "block" });
            $("#depositErrorMsg").html('Hubo un error al procesar su depósito, no has escrito la cantidad o no es un número positivo');
        }
    });

    $("[data-action=deposit]").click(function() {
        var amount = $(this).attr('data-amount');
        if (amount > 0) {
            $.post('https://qb-banking/doDeposit', JSON.stringify({
                amount: parseInt(amount)
            }));
        }
    });

    $("#orderCardBtn").click(function() {
        $("#cardInactive").css({ "display": "none" });
        $("#cardOrdering").css({ "display": "block" });
    });

    $("#processCard").click(function() {
        var pinValue = $('#cardPinNumber').val();
        console.log(pinValue.replace(/[^0-9]/g, "").length);
        if (pinValue !== null && pinValue !== undefined && pinValue.replace(/[^0-9]/g, "").length === 4) {
            $("#pinCreatorError").css({ "display": "none" });
            $("#pinCreatorErrorMsg").html('');
            $.post('https://qb-banking/createDebitCard', JSON.stringify({
                pin: pad(pinValue, 4)
            }));
        } else {
            $("#pinCreatorError").css({ "display": "block" });
            $("#pinCreatorErrorMsg").html('Hubo un error con el pin que has introducido. Por favor, crea un número aleatorio de 4 dígitos de longitud.');
        }

    });

    $("#initiateTransfer").click(function() {
        var amount = $('#transferAmount').val();
        var sortcode = $('#transferSortCode').val();
        var account = $('#transferAcctNo').val();

        if (amount !== undefined && amount !== null && amount > 0 && sortcode !== undefined && sortcode !== null && sortcode > 0 && account !== undefined && account !== null && account > 0) {
            $("#transferError").css({ "display": "none" });
            $("#transferErrorMsg").html('');
            $.post('https://qb-banking/doTransfer', JSON.stringify({
                amount: parseInt(amount),
                account: parseInt(account),
                sortcode: parseInt(sortcode)
            }));
            $('#transferAmount').val('');
            $('#transferSortCode').val('');
            $('#transferAcctNo').val('');
        } else {
            $("#transferError").css({ "display": "block" });
            $("#transferErrorMsg").html('Hubo un error con la información que ingresó, asegúrese de que el número de cuenta, el código de clasificación y la cantidad estén completados correctamente.');
        }

    });

    $("[data-action=withdraw]").click(function() {
        var amount = $(this).attr('data-amount');
        if (amount > 0) {
            $.post('https://qb-banking/doWithdraw', JSON.stringify({
                amount: parseInt(amount)
            }));
        }
    });

    $("[data-action=ATMwithdraw]").click(function() {
        var amount = $(this).attr('data-amount');
        if (currentLimit + parseInt(amount) <= Config.ATMTransLimit) {
            if (amount > 0) {
                $.post('https://qb-banking/doATMWithdraw', JSON.stringify({
                    amount: parseInt(amount)
                }));
                $("#successMessageATM").removeClass('alert-danger').addClass('alert-success');
                $("#successRowATM").css({ "display": "none" });
                $("#successMessageATM").html('');
                currentLimit = currentLimit + parseInt(amount);
            }
        } else {
            // Error Daily Limit Hit.
            $("#successMessageATM").removeClass('alert-success').addClass('alert-danger');
            $("#successRowATM").css({ "display": "block" });
            $("#successMessageATM").html('Lo sentimos, ha alcanzado el límite de retiro diario de ' + Config.ATMTransLimit + '$, utilice una sucursal si necesita dinero antes.');
        }
    });

    $("[data-action=savingsdeposit]").click(function() {
        var amount = $(this).attr('data-amount');
        if (amount > 0) {
            $.post('https://qb-banking/savingsDeposit', JSON.stringify({
                amount: parseInt(amount)
            }));
        }
    });

    $("#makeNewCardRequestBtn1").click(function() {
        $("#requestNewCard1").css({ "display": "none" });
        $("#requestNewCard2").css({ "display": "block" });
    });

    $("#cancelNewCardReq").click(function() {
        $("#requestNewCard2").css({ "display": "none" });
        $("#requestNewCard1").css({ "display": "block" });
    });

    $("#confirmCardRequest").click(function() {
        $("#requestNewCard2").css({ "display": "none" });
        $("#requestNewCard3").css({ "display": "block" });

        $.post('https://qb-banking/requestNewCard', JSON.stringify({

        }));

        setTimeout(function() {
            $("#requestNewCard3").css({ "display": "none" });
            $("#requestNewCard1").css({ "display": "block" });
        }, 5000);
    });

    $("#makeSavingsTransfer").click(function() {
        var amount = $("#savingsTAmount").val();
        var action = $("#savingsAction").val();

        if (action !== null && action !== undefined && action !== 'def' && amount !== null && amount !== undefined && amount > 0) {
            if (action == "deposit") {
                $("#savingsTAmount").val('');
                $("#savingsAction").val('def');
                $.post('https://qb-banking/savingsDeposit', JSON.stringify({
                    amount: parseInt(amount)
                }));
            } else {
                $("#savingsTAmount").val('');
                $("#savingsAction").val('def');
                $.post('https://qb-banking/savingsWithdraw', JSON.stringify({
                    amount: parseInt(amount)
                }));
            }
        }
    });


    $("[data-action=pinNumberBtn]").click(function() {
        var number = $(this).attr('data-number');
        if (number == "ENTER") {
            var enteredPin = $('#pinEntered').val();
            if (enteredPin !== null && enteredPin !== undefined || enteredPin.replace(/[^0-9]/g, "").length !== 4) {
                if (clientPin == enteredPin) {
                    $("#pinErrorMsg").html('');
                    $("#pinErrorDiv").css({ "display": "none" });
                    $('#pinEntered').val('');
                    loadAtmScreen();
                } else {
                    $("#pinErrorMsg").html('Has introducido un PIN incorrecto.');
                    $("#pinErrorDiv").css({ "display": "block" });
                }
            } else {
                $("#pinErrorMsg").html('Debes introducir un PIN de 4 dígitos.');
                $("#pinErrorDiv").css({ "display": "block" });
            }


        } else if (number == "CLEAR") {
            // pin cleared
            $("#pinErrorMsg").html('');
            $("#pinErrorDiv").css({ "display": "none" });
            $('#pinEntered').val('');
        } else {
            var currentVal = $('#pinEntered').val();
            $('#pinEntered').val(currentVal + number);
        }
    });

    $("[data-action=savingswithdraw]").click(function() {
        var amount = $(this).attr('data-amount');
        if (amount > 0) {
            $.post('https://qb-banking/savingsWithdraw', JSON.stringify({
                amount: parseInt(amount)
            }));
        }
    });

    $("#logoffbutton, #logoffbuttonatm").click(function() {
        closeBanking();
    });

    $(".btn, .nav-link").mouseenter(function() {
        over_button.play();
    });
    $(".btn, .nav-link").on("click", function() {
        click.play();
    });

});
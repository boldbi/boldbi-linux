﻿var isKeyUp = false;
$(document).ready(function () {
    addPlacehoder("body");
    var loginFileExtension;
    var mainFileExtension;
    var favExtension;
    var loginFileName;
    var mainFileName;
    var favName;
    var isMainLogoChange = false;
    var isFavIconChange = false;
    var isPowerdbyLogoChange = false;
    var currentDate = $.now();
    var prevLang = $("#language").val();
    var scriptPattern = /<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi;
    var containsScript = false;

    dropDownListInitialization('#time-zone', window.Server.App.LocalizationContent.TimeZone, true);
    dropDownListInitialization('#date-format', window.Server.App.LocalizationContent.DateFormat, true);
    dropDownListInitialization('#time_format', window.Server.App.LocalizationContent.TimeFormat);
    dropDownListInitialization('#language', window.Server.App.LocalizationContent.Language);
    dropDownListInitialization('#mail-account', '');
    dropDownListInitialization('#ai-providers', '');
    dropDownListInitialization('#enable-ssl-site', '');
    document.getElementById("enable-ssl-site").ej2_instances[0].value = isSecureConnection ? "https" : "http";
    document.getElementById("enable-ssl-site").ej2_instances[0].text = isSecureConnection ? "https" : "http";
    document.getElementById("time-zone").ej2_instances[0].value = selectedTimeZoneValue;
    document.getElementById("time-zone").ej2_instances[0].text = selectedTimeZoneText;
    document.getElementById("time_format").ej2_instances[0].value = selectedTimeFormatValue;
    document.getElementById("time_format").ej2_instances[0].text = selectedTimeFormatText;
    document.getElementById("date-format").ej2_instances[0].value = selectedDateFormatValue;
    document.getElementById("date-format").ej2_instances[0].text = selectedDateFormatText;
    document.getElementById("language").ej2_instances[0].value = selectedLanguageValue;
    document.getElementById("language").ej2_instances[0].text = selectedLanguageText;
    document.getElementById("mail-account").ej2_instances[0].value = emailAccountValue;
    document.getElementById("mail-account").ej2_instances[0].text = emailAccountText;
    document.getElementById("ai-providers").ej2_instances[0].value = aiProvidersValue;
    document.getElementById("ai-providers").ej2_instances[0].text = aiProvidersText;

    if ($("#time_format").is(":checked")) {
        $(".time").html(window.Server.App.LocalizationContent.TimeFormatTrue);
    } else {
        $(".time").html(window.Server.App.LocalizationContent.TimeFormatFalse);
    }
    $("#mail-password").show();

    var uploadLoginLogo = new ej.inputs.Uploader({
        asyncSettings: {
            saveUrl: window.fileUploadUrl + "?imageType=loginlogo&&timeStamp=" + currentDate,
        },
        uploading: addHeaders,
        autoUpload: true,
        showFileList: false,
        multiple: false,
        maxFileSize: 30000000,
        allowedExtensions: ".PNG,.png,.jpg,.JPG,.jpeg,.JPEG,.svg,.SVG",
        buttons: { browse: window.Server.App.LocalizationContent.LogoButton },
        selected: function (e) {
            showWaitingPopup('content-area');
            type = e.filesData[0]?.type.toLowerCase();
            var extension = "." + type;
            if (type === undefined) {
                hideWaitingPopup('content-area');
            }
            else if (extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".svg") {
                $(".login-screen-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                $(".login-screen-logo").addClass("upload-error-border");
                hideWaitingPopup('content-area');
            }
            else if (extension === ".svg") {
                var file = e.filesData[0].rawFile;
                var reader = new FileReader();
                reader.onload = function (event) {
                    var fileContent = event.target.result;
                    containsScript = scriptPattern.test(fileContent);

                    if (containsScript) {
                        $(".login-screen-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                        $(".login-screen-logo").addClass("upload-error-border");
                        hideWaitingPopup('content-area');
                    } else {
                        $(".login-screen-logo").find(".validation-error-image").text("");
                        $(".login-screen-logo").removeClass("upload-error-border");
                        uploadLoginLogo.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=loginlogo&&timeStamp=" + currentDate;
                    }

                    scriptPattern.lastIndex = 0;
                };
                reader.readAsText(file);
            }
            else {
                $(".login-screen-logo").find(".validation-error-image").text("");
                $(".login-screen-logo").removeClass("upload-error-border");
                this.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=loginlogo&&timeStamp=" + currentDate;
            }
        },
        success: function fileselect(e) {
            if (!containsScript) {
                var type = e.file.type.toLowerCase() == "svg" ? e.file.type.toLowerCase() : "png";
                var extension = "." + type;
                window.SystemSettingsProperties.LoginLogo = "login_logo_" + currentDate + extension;
                var imageUrl = window.baseRootUrl + "content/images/application/" + "login_logo_" + currentDate + extension + "?v=" + $.now();
                $("#display-login-logo").attr("src", imageUrl);
                hideWaitingPopup('content-area');
                $("#image-container").find(".tooltip-container[data-image='login-screen']").tooltip("hide");
                $('#upload-image').removeAttr("disabled");
            }
        }
    });
    uploadLoginLogo.appendTo("#upload-login-image");

    var uploadMainLogo = new ej.inputs.Uploader({
        asyncSettings: {
            saveUrl: window.fileUploadUrl + "?imageType=mainlogo&&timeStamp=" + currentDate,
        },
        uploading: addHeaders,
        autoUpload: true,
        showFileList: false,
        multiple: false,
        maxFileSize: 30000000,
        allowedExtensions: ".PNG,.png,.jpg,.JPG,.jpeg,.JPEG,.svg,.SVG",
        buttons: { browse: window.Server.App.LocalizationContent.LogoButton },
        selected: function (e) {
            showWaitingPopup('content-area');
            type = e.filesData[0]?.type.toLowerCase();
            var extension = "." + type;
            if (type === undefined) {
                hideWaitingPopup('content-area');
            }
            else if (extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".svg") {
                $(".header-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                $(".header-logo").addClass("upload-error-border");
                hideWaitingPopup('content-area');
            }
            else if (extension === ".svg") {
                var file = e.filesData[0].rawFile;
                var reader = new FileReader();
                reader.onload = function (event) {
                    var fileContent = event.target.result;
                    containsScript = scriptPattern.test(fileContent);

                    if (containsScript) {
                        $(".header-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                        $(".header-logo").addClass("upload-error-border");
                        hideWaitingPopup('content-area');
                    } else {
                        $(".header-logo").find(".validation-error-image").text("");
                        $(".header-logo").removeClass("upload-error-border");
                        uploadLoginLogo.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=mainlogo&&timeStamp=" + currentDate;
                    }

                    scriptPattern.lastIndex = 0;
                };
                reader.readAsText(file);
            }
            else {
                $(".header-logo").find(".validation-error-image").text("");
                $(".header-logo").removeClass("upload-error-border");
                this.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=mainlogo&&timeStamp=" + currentDate;
            }
        },
        success: function fileselect(e) {
            if (!containsScript) {
                var type = e.file.type.toLowerCase() == "svg" ? e.file.type.toLowerCase() : "png";
                var extension = "." + type;
                window.SystemSettingsProperties.MainScreenLogo = "main_logo_" + currentDate + extension;
                isMainLogoChange = true;
                var imageUrl = window.baseRootUrl + "content/images/application/" + "main_logo_" + currentDate + extension + "?v=" + $.now();
                $("#mainscreen_logo_img").attr("src", imageUrl);
                hideWaitingPopup('content-area');
                $("#image-container").find(".tooltip-container[data-image='login-screen']").tooltip("hide");
                $('#upload-image').removeAttr("disabled");
            }
        }
    });
    uploadMainLogo.appendTo("#upload-Main-screen-image");

    var uploadFavicon = new ej.inputs.Uploader({
        asyncSettings: {
            saveUrl: window.fileUploadUrl + "?imageType=favicon&&timeStamp=" + currentDate,
        },
        uploading: addHeaders,
        autoUpload: true,
        showFileList: false,
        multiple: false,
        maxFileSize: 30000000,
        allowedExtensions: ".PNG,.png,.jpg,.JPG,.jpeg,.JPEG,.svg,.SVG,.ico,.ICO",
        buttons: { browse: window.Server.App.LocalizationContent.FavIconButton },
        selected: function (e) {
            showWaitingPopup('content-area');
            type = e.filesData[0]?.type.toLowerCase();
            var extension = "." + type;
            if (type === undefined) {
                hideWaitingPopup('content-area');
            }
            else if (extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".svg" && extension != ".ico") {
                $(".favicon").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                $(".favicon").addClass("upload-error-border");
                hideWaitingPopup('content-area');
            }
            else if (extension === ".svg") {
                var file = e.filesData[0].rawFile;
                var reader = new FileReader();
                reader.onload = function (event) {
                    var fileContent = event.target.result;
                    containsScript = scriptPattern.test(fileContent);

                    if (containsScript) {
                        $(".favicon").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                        $(".favicon").addClass("upload-error-border");
                        hideWaitingPopup('content-area');
                    } else {
                        $(".favicon").find(".validation-error-image").text("");
                        $(".favicon").removeClass("upload-error-border");
                        uploadLoginLogo.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=favicon&&timeStamp=" + currentDate;
                    }

                    scriptPattern.lastIndex = 0;
                };
                reader.readAsText(file);
            }
            else {
                $(".favicon").find(".validation-error-image").text("");
                $(".favicon").removeClass("upload-error-border");
                this.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=favicon&&timeStamp=" + currentDate;
            }
        },
        success: function fileselect(e) {
            if (!containsScript) {
                var type = e.file.type.toLowerCase() == "svg" ? e.file.type.toLowerCase() : "png";
                var extension = "." + type;
                window.SystemSettingsProperties.FavIcon = "favicon_" + currentDate + extension;
                isFavIconChange = true;
                var imageUrl = window.baseRootUrl + "content/images/application/" + "favicon_" + currentDate + extension + "?v=" + $.now();
                $("#favicon_logo_img").attr("src", imageUrl);
                hideWaitingPopup('content-area');
                $("#image-container").find(".tooltip-container[data-image='login-screen']").tooltip("hide");
                $('#upload-image').removeAttr("disabled");
            }
        }
    });
    uploadFavicon.appendTo("#upload-favicon-image");

    var uploadEmailLogo = new ej.inputs.Uploader({
        asyncSettings: {
            saveUrl: window.fileUploadUrl + "?imageType=emaillogo&&timeStamp=" + currentDate,
        },
        uploading: addHeaders,
        autoUpload: true,
        showFileList: false,
        multiple: false,
        maxFileSize: 30000000,
        allowedExtensions: ".PNG,.png,.jpg,.JPG,.jpeg,.JPEG,.svg,.SVG",
        buttons: { browse: window.Server.App.LocalizationContent.LogoButton },
        selected: function (e) {
            showWaitingPopup('content-area');
            type = e.filesData[0]?.type.toLowerCase();
            var extension = "." + type;
            if (type === undefined) {
                hideWaitingPopup('content-area');
            }
            else if (extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".svg") {
                $(".email-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                $(".email-logo").addClass("upload-error-border");
                hideWaitingPopup('content-area');
            }
            else if (extension === ".svg") {
                var file = e.filesData[0].rawFile;
                var reader = new FileReader();
                reader.onload = function (event) {
                    var fileContent = event.target.result;
                    containsScript = scriptPattern.test(fileContent);

                    if (containsScript) {
                        $(".email-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                        $(".email-logo").addClass("upload-error-border");
                        hideWaitingPopup('content-area');
                    } else {
                        $(".email-logo").find(".validation-error-image").text("");
                        $(".email-logo").removeClass("upload-error-border");
                        uploadLoginLogo.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=emaillogo&&timeStamp=" + currentDate;
                    }

                    scriptPattern.lastIndex = 0;
                };
                reader.readAsText(file);
            }
            else {
                $(".email-logo").find(".validation-error-image").text("");
                $(".email-logo").removeClass("upload-error-border");
                this.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=emaillogo&&timeStamp=" + currentDate;
            }
        },
        success: function fileselect(e) {
            if (!containsScript) {
                var type = e.file.type.toLowerCase() == "svg" ? e.file.type.toLowerCase() : "png";
                var extension = "." + type;
                window.SystemSettingsProperties.EmailLogo = "email_logo_" + currentDate + extension;
                var imageUrl = window.baseRootUrl + "content/images/application/" + "email_logo_" + currentDate + extension + "?v=" + $.now();
                $("#email_logo_img").attr("src", imageUrl);
                hideWaitingPopup('content-area');
                $("#image-container").find(".tooltip-container[data-image='login-screen']").tooltip("hide");
                $('#upload-image').removeAttr("disabled");
            }
        }
    });
    uploadEmailLogo.appendTo("#upload-emaillogo-image");

    var uploadAILogo = new ej.inputs.Uploader({
        asyncSettings: {
            saveUrl: window.fileUploadUrl + "?imageType=ailogo&&timeStamp=" + currentDate,
        },
        uploading: addHeaders,
        autoUpload: true,
        showFileList: false,
        multiple: false,
        maxFileSize: 30000000,
        allowedExtensions: ".PNG,.png,.jpg,.JPG,.jpeg,.JPEG,.svg,.SVG",
        buttons: { browse: window.Server.App.LocalizationContent.LogoButton },
        selected: function (e) {
            showWaitingPopup('content-area');
            currentDate = $.now();
            type = e.filesData[0]?.type.toLowerCase();
            var extension = "." + type;
            if (type === undefined) {
                hideWaitingPopup('content-area');
            }
            else if (extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".svg") {
                $(".ai-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                $(".ai-logo").addClass("upload-error-border");
                hideWaitingPopup('content-area');
            }
            else {
                $(".ai-logo").find(".validation-error-image").text("");
                $(".ai-logo").removeClass("upload-error-border");
                this.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=ailogo&&timeStamp=" + currentDate;
            }
        },
        success: function fileselect(e) {
            var type = e.file.type.toLowerCase() == "svg" ? e.file.type.toLowerCase() : "png";
            var extension = "." + type;
            window.SystemSettingsProperties.AILogo = "ai_logo_" + currentDate + extension;
            var imageUrl = window.baseRootUrl + "content/images/application/" + "ai_logo_" + currentDate + extension + "?v=" + $.now();
            $("#ai_logo_img").attr("src", imageUrl);
            hideWaitingPopup('content-area');
            $("#image-container").find(".tooltip-container[data-image='login-screen']").tooltip("hide");
            $('#upload-image').removeAttr("disabled");
        }
    });
    uploadAILogo.appendTo("#upload-ai-logo-image");

    var uploadPoweredLogo = new ej.inputs.Uploader({
        asyncSettings: {
            saveUrl: window.fileUploadUrl + "?imageType=poweredlogo&&timeStamp=" + currentDate,
        },
        uploading: addHeaders,
        autoUpload: true,
        showFileList: false,
        multiple: false,
        maxFileSize: 30000000,
        allowedExtensions: ".PNG,.png,.jpg,.JPG,.jpeg,.JPEG,.svg,.SVG",
        buttons: { browse: window.Server.App.LocalizationContent.LogoButton },
        selected: function (e) {
            showWaitingPopup('content-area');
            type = e.filesData[0]?.type.toLowerCase();
            var extension = "." + type;
            if (type === undefined) {
                hideWaitingPopup('content-area');
            }
            else if (extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".svg") {
                $(".footer-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                $(".footer-logo").addClass("upload-error-border");
                hideWaitingPopup('content-area');
            }
            else if (extension === ".svg") {
                var file = e.filesData[0].rawFile;
                var reader = new FileReader();
                reader.onload = function (event) {
                    var fileContent = event.target.result;
                    containsScript = scriptPattern.test(fileContent);

                    if (containsScript) {
                        $(".footer-logo").find(".validation-error-image").text(window.Server.App.LocalizationContent.InValidFileFormat);
                        $(".footer-logo").addClass("upload-error-border");
                        hideWaitingPopup('content-area');
                    } else {
                        $(".footer-logo").find(".validation-error-image").text("");
                        $(".footer-logo").removeClass("upload-error-border");
                        uploadLoginLogo.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=poweredlogo&&timeStamp=" + currentDate;
                    }

                    scriptPattern.lastIndex = 0;
                };
                reader.readAsText(file);
            }
            else {
                $(".footer-logo").find(".validation-error-image").text("");
                $(".footer-logo").removeClass("upload-error-border");
                this.asyncSettings.saveUrl = window.fileUploadUrl + "?imageType=poweredlogo&&timeStamp=" + currentDate;
            }
        },
        success: function fileselect(e) {
            if (!containsScript) {
                var type = e.file.type.toLowerCase() == "svg" ? e.file.type.toLowerCase() : "png";
                var extension = "." + type;
                window.SystemSettingsProperties.PoweredByLogo = "powered_logo_" + currentDate + extension;
                isPowerdbyLogoChange = true;
                var imageUrl = window.baseRootUrl + "content/images/application/" + "powered_logo_" + currentDate + extension + "?v=" + $.now();
                $("#display-powered-logo").attr("src", imageUrl);
                hideWaitingPopup('content-area');
                $("#image-container").find(".tooltip-container[data-image='login-screen']").tooltip("hide");
                $('#upload-image').removeAttr("disabled");
            }
        }
    });
    uploadPoweredLogo.appendTo("#upload-poweredlogo-image");

    $.validator.addMethod("isValidUrl", function (value, element) {
        var givenUrl = getSslValue() + "://" + $("#site_url").val();
        var url = parseURL(givenUrl);
        if (parseInt(url.port) > 65535)
            return false;
        else
            return true;
    }, window.Server.App.LocalizationContent.IsValidUrl);

    $.validator.addMethod("isRequired", function (value, element) {
        return !isEmptyOrWhitespace(value);
    }, window.Server.App.LocalizationContent.EnterName);

    $.validator.addMethod("isValidContent", function (value, element) {
        return !/^\s/.test(value);
    }, window.Server.App.LocalizationContent.AvoidTrialingWhiteSpace);

    $.validator.addMethod("isValidName", function (value, element) {
        return IsValidName("name", value) && !/^\s/.test(value);
    }, window.Server.App.LocalizationContent.AvoidSpecailCharacters);

    $.validator.addMethod("isValidEmail", function (value, element) {
        return IsEmail(value) && !/^\s/.test(value);
    }, window.Server.App.LocalizationContent.InvalidEmailAddress);

    $.validator.addMethod("isValidCopyRightInfo", function (value, element) {
        return IsValideCopyRightInfo(value);
    }, window.Server.App.LocalizationContent.AvoidInvalidCharacters);

    $(document).on("click", "#UpdateAiSettings", function () {
        var aiModel = document.getElementById("ai-providers").ej2_instances[0].value;
        var modelName = (aiModel == "Azure AI" ? $("#azure-model-name").val().trim() : "");

        if (aiModel == boldaiservice) {
            aiModel = "0";
        } else if (aiModel == openai) {
            aiModel = "1";
        } else if (aiModel == azureai) {
            aiModel = "2";
        }

        if (($("#ai-setting-form").find(".has-error").length == 0)) {

            if (!$("#ai-setting-form").valid()) {
                return;
            }

            var aiSettingsData = {
                AIModel: parseInt(aiModel),
                ModelName: modelName,
                OpenAiApiKey: $("#open-ai-api-key").val().trim(),
                DeploymentName: $("#deployment-name").val().trim(),
                ResourceName: $("#resource-name").val().trim(),
                AzureAiApiKey: $("#azureai-apikey").val().trim()
            };

            var licenseValidationMessage = window.Server.App.LocalizationContent.BoldAIserviceLicenseError
                + "<div class='license-warning-content'>"
                + window.Server.App.LocalizationContent.LicenseWarningContent3 + "<a class='text-decoration-none' href='" + idpUrl + "/ums/administration/license-settings'>" + window.Server.App.LocalizationContent.LicenseWarningContent4 + "</a>" + window.Server.App.LocalizationContent.LicenseWarningContent5
                + "</div>";


            $.ajax({
                type: "POST",
                url: window.updateAISettingsUrl,
                data: { aiSettings: JSON.stringify(aiSettingsData), enableAiFeature: $("#aimodel-enable-switch").is(":checked"), isAiSummariesEnabledGlobally: $("#ai-concent").is(":checked") },
                beforeSend: showWaitingPopup('server-app-container'),
                success: function (result) {
                    if (result.Status) {
                        SuccessAlert(window.Server.App.LocalizationContent.AiSettings, window.Server.App.LocalizationContent.AiSettingsUpdated, 7000);
                        $(".error-message, .success-message").css("display", "none");
                        hideWaitingPopup('server-app-container');
                        window.location.reload();
                    } else if (!(result.Status) && result.HasLicenseError !== undefined && result.HasLicenseError) {
                        hideWaitingPopup('server-app-container');
                        messageBox("", window.Server.App.LocalizationContent.AiConnectionFailed, licenseValidationMessage, "success", function () {
                            onCloseMessageBox();
                        });
                    }
                    else {
                        hideWaitingPopup('server-app-container');
                        messageBox("", window.Server.App.LocalizationContent.AiConnectionFailed, result.Message, "success", function () {
                            onCloseMessageBox();
                        });
                    }
                },
                error: function () {
                    hideWaitingPopup('server-app-container');
                }
            });
        }
    });

    function validateIPWhitelisted() {
        var domain = getSslValue() + "://" + $("#site_url").val();
        $.ajax({
            type: "POST",
            url: validateIPWhitelistedUrl,
            async: false,
            data: { domain: domain },
            success: function (data) {
                if (!data.Data) {
                    $("#site_url").closest("div").addClass("has-error");
                    $("#site-url-validation").css("display", "block");
                    $("#site-url-validation").html(window.Server.App.LocalizationContent.InvalidIpDomain);
                }
                else {
                    $("#site_url").closest("div").removeClass("has-error");
                    $("#site-url-validation").css("display", "none");
                    $("#site-url-validation").html("");
                }
            }
        });
    }

    $("#look-and-feel-form").validate({
        errorElement: "span",
        onkeyup: function (element, event) {
            if (event.keyCode !== 9)
                $(element).valid();
            else
                true;
        },
        onfocusout: function (element) { $(element).valid(); },
        rules: {
            "site_name": {
                isRequired: true,
                maxlength: 255
            },
            "site_url": {
                isRequired: true,
                isValidUrl: true
            },
            "copy_right_info": {
                isRequired: true,
                isValidCopyRightInfo: true,
                maxlength: 255
            }
        },
        highlight: function (element) {
            $(element).closest("div").addClass("has-error");
        },
        unhighlight: function (element) {
            $(element).closest("div").removeClass("has-error");
            if (element.id == "site_url") {
                $(element).parent().parent().next().html("");
            }
            else {
                $(element).parent().find("span.validation-errors").html("");
            }
        },
        errorPlacement: function (error, element) {
            if (element.attr("id") == "site_url") {
                $(element).parent().parent().next().html(error);
            }
            else {
                $(element).parent().find("span.validation-errors").html(error);
            }
        },
        messages: {
            "site_name": {
                isRequired: window.Server.App.LocalizationContent.OrganizationName
            },
            "site_url": {
                isRequired: window.Server.App.LocalizationContent.Urlvalidator
            },
            "copy_right_info": {
                isRequired: window.Server.App.LocalizationContent.CopyRightValidator
            }
        }
    });

    $("#email-setting-form").validate({
        errorElement: "span",
        onkeyup: function (element, event) {
            if (event.keyCode != 9) {
                isKeyUp = true;
                if (element.id !== "mail-password") {
                    $(element).valid();
                }
                else {
                    if ($(element).val() !== "") {
                        $(element).valid();
                    }
                }

                isKeyUp = false;
            }
            else
                true;
        },
        onfocusout: function (element) {
            if (element.id !== "mail-password") {
                $(element).valid();
            }
            else {
                if ($(element).val() === "") {
                    $(element).valid();
                }
            }
        },
        rules: {
            "smtp_address": {
                isRequired: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                },
                isValidContent: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                }
            },
            "port_number": {
                isRequired: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                },
                isValidContent: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                }
            },
            "mail_display_name": {
                isRequired: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                },
                isValidName: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                }
            },
            "mail_user_name": {
                isRequired: {
                    depends: function () {
                        return (parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0 || parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 1);
                    }
                },
                isValidEmail: {
                    depends: function () {
                        return (parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0 || parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 1);
                    }
                }
            },
            "mail_password": {
                isRequired: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                },
                isValidContent: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                }
            },
            "sender_user_name": {
                isRequired: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                },
                isValidContent: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 0;
                    }
                }
            },
            "tenant_id": {
                isRequired: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 1;
                    }
                },
                isValidContent: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 1;
                    }
                }
            },
            "client_id": {
                isRequired: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 1;
                    }
                },
                isValidContent: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 1;
                    }
                }
            },
            "client_secret": {
                isRequired: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 1;
                    }
                },
                isValidContent: {
                    depends: function () {
                        return parseInt(document.getElementById("mail-account").ej2_instances[0].value) === 1;
                    }
                }
            }
        },
        highlight: function (element) {
            $(element).closest("div").addClass("has-error");
        },
        unhighlight: function (element) {
            $(element).closest("div").removeClass("has-error");
            $(element).parent().find("span.validation-errors").html("");
        },
        errorPlacement: function (error, element) {
            $(element).parent().find("span.validation-errors").html(error);
        },
        messages: {
            "smtp_address": {
                isRequired: window.Server.App.LocalizationContent.MailSMTPServerValidator
            },
            "port_number": {
                isRequired: window.Server.App.LocalizationContent.MailSMTPPortValidator
            },
            "mail_display_name": {
                isRequired: window.Server.App.LocalizationContent.SenderNameValidator
            },
            "mail_user_name": {
                isRequired: window.Server.App.LocalizationContent.SenderEmailValidator
            },
            "mail_password": {
                isRequired: window.Server.App.LocalizationContent.PasswordValidator
            },
            "sender_user_name": {
                isRequired: window.Server.App.LocalizationContent.UserNameValidator
            },
            "tenant_id": {
                isRequired: window.Server.App.LocalizationContent.TenantId
            },
            "client_id": {
                isRequired: window.Server.App.LocalizationContent.ClientId
            },
            "client_secret": {
                isRequired: window.Server.App.LocalizationContent.ClientSecret
            }
        }
    });

    $("#ai-setting-form").validate({
        errorElement: "span",
        onkeyup: function (element, event) {
            if (event.keyCode != 9) {
                isKeyUp = true;
                if ($(element).val() !== "") {
                    $(element).valid();
                }
                isKeyUp = false;
            }
            else
                true;
        },
        onfocusout: function (element) {
            if ($(element).val() === "") {
                $(element).valid();
            }
        },
        rules: {
            "openai_apikey": {
                isRequired: {
                    depends: function () {
                        return $("#aimodel-enable-switch").is(":checked") && document.getElementById("ai-providers").ej2_instances[0].value === "Open AI";
                    }
                },
                isValidContent: {
                    depends: function () {
                        return $("#aimodel-enable-switch").is(":checked") && document.getElementById("ai-providers").ej2_instances[0].value === "Open AI";
                    }
                }
            },
            "azure_model_name": {
                isRequired: {
                    depends: function () {
                        return false;
                    }
                },
                isValidName: {
                    depends: function () {
                        return false;
                    }
                }
            },
            "resource_name": {
                isRequired: {
                    depends: function () {
                        return $("#aimodel-enable-switch").is(":checked") && document.getElementById("ai-providers").ej2_instances[0].value === "Azure AI";
                    }
                },
                isValidName: {
                    depends: function () {
                        return $("#aimodel-enable-switch").is(":checked") && document.getElementById("ai-providers").ej2_instances[0].value === "Azure AI";
                    }
                }
            },
            "deployment_name": {
                isRequired: {
                    depends: function () {
                        return $("#aimodel-enable-switch").is(":checked") && document.getElementById("ai-providers").ej2_instances[0].value === "Azure AI";
                    }
                },
                isValidName: {
                    depends: function () {
                        return $("#aimodel-enable-switch").is(":checked") && document.getElementById("ai-providers").ej2_instances[0].value === "Azure AI";
                    }
                }
            },
            "azureai_apikey": {
                isRequired: {
                    depends: function () {
                        return $("#aimodel-enable-switch").is(":checked") && document.getElementById("ai-providers").ej2_instances[0].value === "Azure AI";
                    }
                },
                isValidName: {
                    depends: function () {
                        return $("#aimodel-enable-switch").is(":checked") && document.getElementById("ai-providers").ej2_instances[0].value === "Azure AI";
                    }
                }
            }
        },
        highlight: function (element) {
            $(element).closest("div").addClass("has-error");
        },
        unhighlight: function (element) {
            $(element).closest("div").removeClass("has-error");
            $(element).parent().find("span.validation-errors").html("");
        },
        errorPlacement: function (error, element) {
            $(element).parent().find("span.validation-errors").html(error);
        },
        messages: {
            "openai_apikey": {
                isRequired: window.Server.App.LocalizationContent.OpenAiKeyValidator
            },
            "azure_model_name": {
                isRequired: window.Server.App.LocalizationContent.AzureAiModelNameValidator
            },
            "resource_name": {
                isRequired: window.Server.App.LocalizationContent.AzureAiResourceNameValidator
            },
            "deployment_name": {
                isRequired: window.Server.App.LocalizationContent.AzureAiDeployementNameValidator
            },
            "azureai_apikey": {
                isRequired: window.Server.App.LocalizationContent.AzureAiKeyValidator
            }
        }
    });


    if ($("#active-directory-container").is(":visible")) {
        var query = (window.location.search).toString();
        if (query == "?tab=azure-ad") {
            $("#azure-ad").tab("show");
            $("#update-active-dir-settings").hide();
            $("#UpdateAzureADSettings-bottom").removeClass("visually-hidden");
        }
    }

    $(document).ready(function () {
        if ($("#active-directory-container").is(":visible")) {
            if (location.href.match(/azure-ad/)) {
                $("#azure-ad").tab("show");
                $("#update-active-dir-settings").hide();
                $("#UpdateAzureADSettings-bottom").removeClass("visually-hidden");
                $("#save-db-settings").hide();
                $("#connect-database").hide();
                $("#change-connection").hide();

            }
            else if (location.href.match(/database-settings/)) {
                $("#database-settings").tab("show");
                $("#connect-database").show();
                $("#save-db-settings").hide();
                $("#update-active-dir-settings").hide();
                $("#UpdateAzureADSettings-bottom").addClass("visually-hidden");
                $("#change-connection").hide();

            } else {
                $("#windows-ad").tab("show");
                $("#update-active-dir-settings").show();
                $("#save-db-settings").hide();
                $("#connect-database").hide();
                $("#change-connection").hide();
            }

        }
        if (ignoreSslValidation) {
            $("#ssl-certificate").prop("checked", true);
        }
        else {
            $("#ssl-certificate").prop("checked", false);
        }
    });

    $(document).on("change", "#enablepoweredbysyncfusion", function () {
        if ($("#enablepoweredbysyncfusion").is(":checked") == false) {
            $("#poweredbysyncfusion").removeClass("d-block").hide();
            $("#upload-poweredlogo-image").children().find(".e-uploadinput").attr('disabled', true);
            $(".footer-logo").find(".logo-description h3").addClass('powerdby-logo-disabled');
            $(".footer-logo").find(".logo-description p").addClass('powerdby-logo-disabled');
            $(".powerdby-section").children().find(".upload-link button").addClass("powerdby-logo-disabled");
        }
        else {
            $("#poweredbysyncfusion").removeClass("d-none").show();
            $("#upload-poweredlogo-image").children().find(".e-uploadinput").attr('disabled', false);
            $(".footer-logo").find(".logo-description h3").removeClass('powerdby-logo-disabled');
            $(".footer-logo").find(".logo-description p").removeClass('powerdby-logo-disabled');
            $(".powerdby-section").children().find(".upload-link button").removeClass("powerdby-logo-disabled");
        }
        addFooterSeparator();
    });

    $(document).on("change", "#enablecopyrightinfo", function () {
        if ($("#enablecopyrightinfo").is(":checked") == false) {
            $("#copyrightinfo").removeClass("d-block").hide();
            $("#site-copyright").attr('disabled', 'disabled');
            $("#site-copyright-error").html("");
            $("#site-copyright-error").hide();
            $("#site-copyright").attr("style", "border-color:var(--input-box-border-normal-color) !important");
            if ($("#site-copyright").val() === '') {
                document.getElementById("site-copyright").value = copyrightInformation;
                $("#site-copyright").closest("div").removeClass("has-error");
            }
        }
        else {
            $("#copyrightinfo").removeClass("d-none").show();
            $("#site-copyright").removeAttr('disabled');
            $("#site-copyright-error").show();
            if ($("#site-copyright").val() === '') {
                $("#site-copyright-error").html(window.Server.App.LocalizationContent.CopyRightValidator);
                $("#site-copyright").closest("div").addClass("has-error");
            }
            else {
                $("#site-copyright").closest("div").removeClass("has-error");
            }
        }
        addFooterSeparator();
    });

    if (typeof (isEnableCopyrightInfo) != "undefined" && isEnableCopyrightInfo) {
        $("#enablecopyrightinfo").attr("checked", true);
        $("#copyrightinfo").removeClass("d-none").addClass("d-block");
        $('#site-copyright').attr('disabled', false);
    }
    else {
        $("#enablecopyrightinfo").attr("checked", false)
        $("#copyrightinfo").removeClass("d-none").addClass("d-none");
        $('#site-copyright').attr('disabled', true);
    }

    if (typeof (isEnablePoweredBySyncfusion) != "undefined" && isEnablePoweredBySyncfusion) {
        $("#enablepoweredbysyncfusion").attr("checked", true)
        $("#poweredbysyncfusion").removeClass("d-none").addClass("d-block");
        $("#upload-poweredlogo-image").children().find(".e-uploadinput").attr('disabled', false);
        $(".footer-logo").find(".logo-description h3").removeClass('powerdby-logo-disabled');
        $(".footer-logo").find(".logo-description p").removeClass('powerdby-logo-disabled');
        $("#upload-poweredlogo-image").children().find("#upload-poweredlogo-image_SelectButton").removeClass('powerdby-logo-link-disabled');
    }
    else {
        $("#enablepoweredbysyncfusion").attr("checked", false)
        $("#poweredbysyncfusion").removeClass("d-none").addClass("d-none");
        $("#upload-poweredlogo-image").children().find(".e-uploadinput").attr('disabled', true);
        $(".footer-logo").find(".logo-description h3").addClass('powerdby-logo-disabled');
        $(".footer-logo").find(".logo-description p").addClass('powerdby-logo-disabled');
        $("#upload-poweredlogo-image").children().find("#upload-poweredlogo-image_SelectButton").addClass('powerdby-logo-link-disabled');
    }

    $(document).on("click", "#UpdateSystemSettings,#UpdateSystemSettings-bottom,#UpdateDatabaseSettings-bottom,#update-mail-settings", function () {


        if (($("#look-and-feel-form").find(".has-error").length == 0 && $("#email-setting-form").find(".has-error").length == 0)) {
            var messageHeader = $(this).hasClass("update-system-settings") ? window.Server.App.LocalizationContent.SiteSettings : window.Server.App.LocalizationContent.EmailSettings;
            var enableSecureMail = $("#secure-mail-authentication").is(":checked");
            RemoveUploadBoxError();

            if (!$("#look-and-feel-form").valid() || !$("#email-setting-form").valid()) {
                return;
            }

            var isMailSettingsChanged = false;
            var isMailPasswordChanged = false;
            var mailSettings = new Object;
            if (parseInt($("#port-number").val()) != window.SystemSettingsProperties.MailSettingsPort
                || $("#smtp-address").val() != window.SystemSettingsProperties.MailSettingsHost
                || $("#mail-display-name").val() != window.SystemSettingsProperties.MailSettingsSenderName
                || $("#mail-user-name").val() != window.SystemSettingsProperties.MailSettingsAddress
                || enableSecureMail != window.SystemSettingsProperties.MailSettingsIsSecureAuthentication) {
                isMailSettingsChanged = true;

                mailSettings = {
                    Address: $("#mail-user-name").val(),
                    Password: $("#mail_password").val(),
                    Host: $("#smtp-address").val(),
                    SenderName: $("#mail-display-name").val(),
                    Port: parseInt($("#port-number").val()),
                    IsSecureAuthentication: enableSecureMail
                };
            }

            if ($("#mail-password").val() !== "") {
                isMailPasswordChanged = true;
            }

            var mailProtocol = document.getElementById("mail-account").ej2_instances[0].value != undefined && !isNullOrWhitespace(document.getElementById("mail-account").ej2_instances[0].value) ? parseInt(document.getElementById("mail-account").ej2_instances[0].value) : 0;
            var mailSettings = {
                MailSettingsAddress: $("#mail-user-name").val(),
                MailSettingsAuthType: mailProtocol == 0 ? parseInt($("input[name='mail-authentication-type']:checked").val()) : $("#oauth-mail-authentication-type").val(),
                MailSettingsUserName: parseInt($("input[name='mail-authentication-type']:checked").val()) === 1 ? $("#sender-user-name").val() : "",
                MailSettingsPassword: parseInt($("input[name='mail-authentication-type']:checked").val()) === 1 ? $("#mail-password").val() : "",
                MailSettingsHost: $("#smtp-address").val(),
                MailSettingsSenderName: $("#mail-display-name").val(),
                MailSettingsPort: parseInt($("#port-number").val()) != undefined && !isNullOrWhitespace($("#port-number").val()) ? parseInt($("#port-number").val()) : 0,
                MailSettingsIsSecureAuthentication: enableSecureMail,
                MailSettingsAccount: mailProtocol,
                MailSettingsTenantId: $("#tenant-id").val(),
                MailSettingsClientId: $("#client-id").val(),
                MailSettingsClientSecret: $("#client-secret").val(),
            };

            var systemSettingsData = {
                OrganizationName: $("#site-orgname").val(),
                LoginLogo: window.SystemSettingsProperties.LoginLogo,
                MainScreenLogo: window.SystemSettingsProperties.MainScreenLogo,
                FavIcon: window.SystemSettingsProperties.FavIcon,
                EmailLogo: window.SystemSettingsProperties.EmailLogo,
                AILogo: window.SystemSettingsProperties.AILogo,
                PoweredByLogo: window.SystemSettingsProperties.PoweredByLogo,
                WelcomeNoteText: $("#txt_welcome_note").val(),
                TimeZone: document.getElementById("time-zone").ej2_instances[0].value,
                DateFormat: document.getElementById("date-format").ej2_instances[0].value,
                MailSettings: mailSettings,
                MachineName: $("#machineName").val(),
                HostDomain: $("#hostDomain").val(),
                Language: document.getElementById("language").ej2_instances[0].value,
                IsEnablePoweredBySyncfusion: $("#enablepoweredbysyncfusion").is(":checked"),
                IsEnableCopyrightInfo: $("#enablecopyrightinfo").is(":checked"),
                CopyrightInformation: $("#site-copyright").val(),
                TimeFormat: document.getElementById("time_format").ej2_instances[0].value,
            };

            $.ajax({
                type: "POST",
                url: window.updateSystemSettingsUrl,
                data: { systemSettingsData: JSON.stringify(systemSettingsData) },
                beforeSend: showWaitingPopup('server-app-container'),
                success: function (result) {

                    if (isMainLogoChange) {
                        $("#application-logo").attr("src", window.baseRootUrl + "content/images/application/" + systemSettingsData.MainScreenLogo);
                    }

                    if (isPowerdbyLogoChange) {
                        $("#poweredbysyncfusion img").attr("src", window.baseRootUrl + "content/images/application/" + systemSettingsData.PoweredByLogo);
                    }

                    $("#copyrightinfo").html(systemSettingsData.CopyrightInformation);
                    if (isFavIconChange) {
                        var link = document.createElement("link");
                        link.type = "image/x-icon";
                        link.rel = "shortcut icon";
                        link.href = window.baseRootUrl + "content/images/application/" + systemSettingsData.FavIcon;
                        document.getElementsByTagName("head")[0].appendChild(link);
                    }

                    var pageTitle = document.title.split("-")[0] + " - " + $("#site-orgname").val();
                    document.title = pageTitle;


                    if (result.status) {
                        if ($("#enablepoweredbysyncfusion").is(":checked")) {
                            $("#poweredbysyncfusion").removeClass("d-none").addClass("d-block");
                        } else {
                            $("#poweredbysyncfusion").removeClass("d-block").addClass("d-none");
                        }
                        if ($("#enablecopyrightinfo").is(":checked")) {
                            $("#copyrightinfo").removeClass("d-none").addClass("d-block");
                        } else {
                            $("#copyrightinfo").removeClass("d-block").addClass("d-none");
                        }
                        if ($("#enablepoweredbysyncfusion").is(":checked") && $("#enablecopyrightinfo").is(":checked")) {
                            $("#footer-separator").removeClass("d-none").addClass("d-block");
                        } else {
                            $("#footer-separator").removeClass("d-block").addClass("d-none");
                        }
                        SuccessAlert(messageHeader, window.Server.App.LocalizationContent.SiteSettingsUpdated, 7000);
                        SetCookie();
                    } else {
                        WarningAlert(messageHeader, window.Server.App.LocalizationContent.SiteSettingsUpdateFalied, result.Message, 7000);
                        $(".error-message, .success-message").css("display", "none");
                    }
                    hideWaitingPopup('server-app-container');
                }
            });
        }
    });


    EnableOrDisableAIModel();
});

$(document).ready(function () {
    emailConfiguration();
});

function emailConfiguration() {
    $(".validation-txt-errors").hide();
    $(".validation-errors").html("");
    $("#test-connection-validation").hide();
    $("#test-connection-validation").removeClass("failure").html("");
    $(".has-error").removeClass("has-error");
    $(".secrets-field input[type='text'], .secrets-field input[type='password']").val("");
    $(".secrets-field-pwsd input[type='text'], .secrets-field-pwsd input[type='password']").val("");
    var checkedVal = document.getElementById("mail-account").ej2_instances[0].value;

    switch (checkedVal) {
        case "0":
            $(".oauth-field").hide();
            $(".smtp-field").show();
            $("#client-id").val("");
            $("#client-secret").val("");
            $("#tenant-id").val("");
            $("div.placeholder").remove();
            break;
        case "1":
            $(".smtp-field").hide();
            $(".oauth-field").show();
            $("#smtp-address").val("");
            $("#port-number").val("");
            $("#mail-display-name").val("");
            $("#sender-user-name").val("");
            $("#secure-mail-authentication").prop("checked", false);
            $("div.placeholder").remove();
            break;
    }
}
$(document).ready(function () {
    aiConfiguration();
});

function aiConfiguration() {
    $(".validation-txt-errors").hide();
    $(".validation-errors").html("");
    $(".has-error").removeClass("has-error");
    var checkedVal = document.getElementById("ai-providers").ej2_instances[0].value;

    switch (checkedVal) {
        case boldaiservice:
            $(".bold-ai-service").show();
            $(".openai-field").hide();
            $(".azureai-field").hide();
            $("div.placeholder").remove();
            break;
        case openai:
            $(".bold-ai-service").hide();
            $(".azureai-field").hide();
            $(".openai-field").show();
            $("div.placeholder").remove();
            break;
        case azureai:
            $(".bold-ai-service").hide();
            $(".openai-field").hide();
            $(".azureai-field").show();
            $("div.placeholder").remove();
            break;
    }
}


$(document).on('click', '#aimodel-enable-switch', function () {
    EnableOrDisableAIModel();
});

function EnableOrDisableAIModel() {
    if ($("#aimodel-enable-switch").is(":checked")) {
        $("#open-ai-api-key").prop("disabled", false);
        $("#azure-model-name").prop("disabled", false);
        $("#resource-name").prop("disabled", false);
        $("#deployment-name").prop("disabled", false);
        $("#azureai-apikey").prop("disabled", false);
        $("#ai-concent").prop("disabled", false);
        document.getElementById("ai-providers").ej2_instances[0].enabled = true;
    }
    else {
        document.getElementById("ai-providers").ej2_instances[0].enabled = false;
        $("#ai-providers").prop("disabled", true);
        $("#open-ai-api-key").prop("disabled", true);
        $("#azure-model-name").prop("disabled", true);
        $("#resource-name").prop("disabled", true);
        $("#deployment-name").prop("disabled", true);
        $("#azureai-apikey").prop("disabled", true);
        $("#ai-concent").prop("disabled", true);
        clearValidationErrors();
    }
};

function clearValidationErrors() {
    $("#ai-setting-form").find("input").each(function () {
        $(this).removeClass("has-error");
        $(this).closest("div").removeClass("has-error");
        $(this).parent().find("span.validation-errors").html("");
        $(this).valid();
    });
}

$(document).on("change", "#mail-password , #sender-user-name", function () {
    if ($("#mail-password").val() !== "")
        $("#mail-password-error").remove();
    if ($("#sender-user-name").val() !== "")
        $("#sender-user-name-error").remove();
});

$(document).on('click', "a[data-bs-toggle='tab']", function (e) {
    if ($(this).attr("id") == "azure-ad") {
        $("#update-active-dir-settings").hide();
        $("#UpdateAzureADSettings-bottom").removeClass("visually-hidden");
        $("#save-db-settings").hide();
        $("#connect-database").hide();
        $("#change-connection").hide();
        $("#azure-ad-tab span.validation-message").addClass("ng-hide").parent().removeClass("has-error");
    }
    else if ($(this).attr("id") == "windows-ad") {
        $("#UpdateAzureADSettings-bottom").addClass("visually-hidden");
        $("#update-active-dir-settings").show();
        $("#save-db-settings").hide();
        $("#connect-database").hide();
        $("#change-connection").hide();
        $("#windows-ad-tab .error").hide().parent().parent().removeClass("has-error");
    }
    else {
        if ($("#schema-selection").length == 0) {
            $("#connect-database").show();
            $("#save-db-settings").hide();
            $("#update-active-dir-settings").hide();
            $("#change-connection").hide();
            $("#UpdateAzureADSettings-bottom").addClass("visually-hidden");
        } else {
            $("#change-connection").trigger("click");
            $("#connect-database").show();
            $("#save-db-settings").hide();
            $("#update-active-dir-settings").hide();
            $("#change-connection").hide();
            $("#UpdateAzureADSettings-bottom").addClass("visually-hidden");
        }
    }
    $(".success-message, .error-message").hide();
});


$(document).on("change", "#enable-ssl", function () {
    $("#help_text").css("display", $(this).val() === "https" ? "block" : "none");
});

$(document).on("click", "#help_text", function () {
    $("#ssl-help-message").toggle();
});

$(document).on("click", "#time_format", function () {
    if ($("#time_format").is(":checked")) {
        $(".time").html(window.Server.App.LocalizationContent.TimeFormatTrue);
    } else {
        $(".time").html(window.Server.App.LocalizationContent.TimeFormatFalse);
    }
});

$(document).on("click", "#update-active-dir-settings", function () {
    var adSettingsData = {
        UserName: $("#username").val().trim(),
        Password: $("#password").val().trim(),
        LdapURL: $("#ldapurl").val().trim(),
        EnableSsl: $("#enable-ldap-ssl").is(":checked"),
        DistinguishedName: $("#distinguished-name").val(),
        PortNo: $("#ldap-port-number").val().trim()
    };

    $.ajax({
        type: "POST",
        url: window.updateAdSettingsUrl,
        data: { ADSettingsData: JSON.stringify(adSettingsData) },
        beforeSend: showWaitingPopup('server-app-container'),
        success: function (result) {
            if (result.status) {
                SuccessAlert(window.Server.App.LocalizationContent.ADSettings, window.Server.App.LocalizationContent.SiteSettingsUpdated, 7000);
            }
            else {
                WarningAlert(window.Server.App.LocalizationContent.ADSettings, window.Server.App.LocalizationContent.SiteSettingsUpdateFalied, null, 7000);
            }
            $(".error-message, .success-message").css("display", "none");
        },
        complete: function () {
            hideWaitingPopup('server-app-container');
        }
    });
});

$(document).on("change", "input[name='mail-authentication-type']", function () {
    var authTextBoxes = $(".mail-credentials");

    if (parseInt($(this).val()) === 1) {
        authTextBoxes.removeAttr("disabled");
    } else {
        authTextBoxes.attr("disabled", "disabled").val("").parent().removeClass("has-error");
        authTextBoxes.siblings(".validation-errors").text("");
    }
});

$(document).on("mouseenter", ".highlight-image", function () {
    var image = $(this).attr("data-image").toLowerCase();

    $("#image-container").find(".tooltip-container[data-image='" + image + "']").tooltip("show");
});

$(document).on("mouseleave", ".highlight-image", function () {
    var image = $(this).attr("data-image").toLowerCase();

    $("#image-container").find(".tooltip-container[data-image='" + image + "']").tooltip("hide");
});

$(document).on("mouseenter", ".tooltip-container", function () {
    var image = $(this).attr("data-image").toLowerCase();

    $(".highlight-image[data-image='" + image + "']").find(".form-control, .input-group-addon").css({ "border-color": "#009AEF", "box-shadow": "0 2px 2px 2px #E8F9FF" });
});

$(document).on("mouseleave", ".tooltip-container", function () {
    var image = $(this).attr("data-image").toLowerCase();

    $(".highlight-image[data-image='" + image + "']").find(".form-control, .input-group-addon").removeAttr("style");
});

$(document).on("click", "#UpdateAzureADSettings-bottom", function () {
    var adSettingsData = {
        TenantName: $("#tenantName").val().trim(),
        ClientID: $("#clientId").val().trim(),
        ClientKey: $("#clientKey").val().trim()
    };

    $.ajax({
        type: "POST",
        url: window.updateAzureADSettingsUrl,
        data: { ADSettingsData: JSON.stringify(adSettingsData) },
        beforeSend: showWaitingPopup('server-app-container'),
        success: function (result) {
            if (result.status) {
                SuccessAlert(window.Server.App.LocalizationContent.AzureADSettings, window.Server.App.LocalizationContent.SiteSettingsUpdated, 7000);
            }
            else {
                WarningAlert(window.Server.App.LocalizationContent.AzureADSettings, window.Server.App.LocalizationContent.SiteSettingsUpdateFalied, null, 7000);
            }
            $(".azure-ad-button-area .error-message, .azure-ad-button-area .success-message").css("display", "none");
            hideWaitingPopup('server-app-container');
        },
        error: function () {
            hideWaitingPopup('server-app-container');
        }
    });
});


function AzureADFormValidate() {
    $(".success-message").hide();
    var postData = {
        tenantName: $("#tenantName").val().trim(),
        clientId: $("#clientId").val().trim(),
        clientKey: $("#clientKey").val().trim()
    };

    $.ajax({
        type: "POST",
        url: window.azureadTestconnectionUrl,
        data: postData,
        beforeSend: showWaitingPopup('server-app-container'),
        success: function (data) {
            if (data.status) {
                $("#azure-ad-setting .success-message").html("<span style='color:green'>" + data.value + "</span>");
                $("#azure-ad-setting .error-message").css("display", "none");
                $("#azure-ad-setting .success-message").css("display", "block");
            }
            else {
                $("#azure-ad-setting .error-message").html("<span style='color:red'>" + data.value + "</span>");
                $("#azure-ad-setting .success-message").css("display", "none");
                $("#azure-ad-setting .error-message").css("display", "block");
            }
        },
        complete: function () {
            hideWaitingPopup('server-app-container');
        }
    });
}

function RemoveUploadBoxError() {
    $("#upload-login-image-textbox").removeClass("ValidationErrorImage").val(window.Server.App.LocalizationContent.BrowsePath);
    $("#upload-login-image-textbox").closest("div").removeClass("has-error");
    $("#upload-login-image-textbox").parent().find(".e-box").removeClass("upload-error-border");
    $("#upload-main-screen-image-textbox").removeClass("ValidationErrorImage").val(window.Server.App.LocalizationContent.BrowsePath);
    $("#upload-main-screen-image-textbox").closest("div").removeClass("has-error");
    $("#upload-main-screen-image-textbox").parent().find(".e-box").removeClass("upload-error-border");
    $("#upload-favicon-image-textbox").removeClass("ValidationErrorImage").val(window.Server.App.LocalizationContent.BrowsePath);
    $("#upload-favicon-image-textbox").closest("div").removeClass("has-error");
    $("#upload-favicon-image-textbox").parent().find(".e-box").removeClass("upload-error-border");
    $("#upload-poweredogo-image-textbox").removeClass("ValidationErrorImage").val(window.Server.App.LocalizationContent.BrowsePath);
    $("#upload-poweredogo-image-textbox").closest("div").removeClass("has-error");
    $("#upload-poweredogo-image-textbox").parent().find(".e-box").removeClass("upload-error-border");
}

function parseURL(str) {
    var o = parseURL.options,
        m = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
        uri = {},
        i = 14;

    while (i--) uri[o.key[i]] = m[i] || "";

    uri[o.q.name] = {};
    uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
        if ($1) uri[o.q.name][$1] = $2;
    });

    return uri;
};

parseURL.options = {
    strictMode: true,
    key: ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "anchor"],
    q: {
        name: "queryKey",
        parser: /(?:^|&)([^&=]*)=?([^&]*)/g
    },
    parser: {
        strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
        loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
    }
};

function SetCookie() {
    if ($("#lang_tag").val() !== $("#language_hidden").val()) {
        $.ajax({
            type: "POST",
            url: window.setLanguageUrl,
            data: { returnUrl: $("#return_url").val() + "/ums/administration" },
            success: function (result) {
                location.reload();
            }
        });
    }
}

function addPlacehoder(object) {
    if (regexIe8.test(userAgent)) {
        $(object).find("input[type=text][class!='hidden-input'],input[type=password][class!='hidden-input'],textarea[id='txt_welcome_note']").each(function () {
            if ($(this).val() === "") {
                $($("<div>", { "class": "placeholder", text: $(this).attr("placeholder") })).insertAfter(this).show();
            }
            else {
                $($("<div>", { "class": "placeholder", text: $(this).attr("placeholder"), "style": "display:block" })).insertAfter(this).hide();
            }
        });
    }
}

function addFooterSeparator() {
    if ($("#enablepoweredbysyncfusion").is(":checked") == true && $("#enablecopyrightinfo").is(":checked") == true) {
        $("#footer-separator").removeClass("d-none").show();
    }
    else {
        $("#footer-separator").removeClass("d-block").hide();
    }
}

function getSslValue() {
    return document.getElementById("enable-ssl").ej2_instances[0].value;
}

$(document).ready(function () {
    $("#display-login-logo,#mainscreen_logo_img,#favicon_logo_img,#email_logo_img,#display-powered-logo").on("error", function () {
        $(this).off("error"); // Remove the error event handler to prevent an infinite loop
        $(this).attr("src", '@Url.Content("~/images/boldid/application/" + IconFileNames.DefaultErrorSquareImage)');
    });
});
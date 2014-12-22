<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="default.home.label"/></title>
</head>

<body>
<div class="page-header">
    <h1>Process Management</h1>
</div>

    <g:if test="${flash.error}">
        <div class="alert alert-error" style="display: block">${flash.error}</div>
    </g:if>
    <g:if test="${flash.message}">
        <div class="message" style="display: block">${flash.message}</div>
    </g:if>


    <div class="row">
        <div class="col-md-6">
            <div class="col-md-6">
                <g:message code="deployment.upload.file" default="Upload Form: "/>
                <g:uploadForm action="upload">
                    <input type="file" name="myFile" />
                    <input type="submit" />
                </g:uploadForm>
            </div>
            <div class="col-md-6">
                <g:message  code="deployment.upload.list" default="Name"/><br>
                <g:link class="edit btn btn-sm btn-grey" controller="deployment" action="index">
                    <g:message code="default.list.button.label" default="List"/>
                </g:link>
            </div>
        </div>
    </div>

    %{--<div class="tab-content">
        <div class="tab-pane active" id="fileUpload">
            <div class="controls" style="font-style: italic">
                <ul class="one-to-many">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th><g:message code="deployment.upload.file" default="Upload Form: "/></th>
                            <th><g:message  code="deployment.upload.list" default="Name"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><g:uploadForm action="upload">
                                <input type="file" name="myFile" />
                                <input type="submit" />
                            </g:uploadForm></td>
                            <td><g:link class="edit btn btn-sm btn-grey" controller="deployment" action="index">
                                <g:message code="default.list.label" default="List"/>
                            </g:link></td>
                        </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
        </div>
    </div>--}%

    <div class="tab-content">
        <div class="tab-pane active" id="processes">

            <div class="controls" style="font-style: italic">
                <ul class="one-to-many">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th><g:message code="default.process.id" default="Id"/></th>
                            <th><g:message  code="default.process.name" default="Name"/></th>
                            %{--<th><g:message  code="default.process.key" default="Key"/></th>--}%
                            <th><g:message  code="default.process.version" default="Version"/></th>
                            <th><g:message  code="default.process.instances" default="Instances"/></th>
                            <th><g:message  code="default.action.label" default="Action"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${processes}" status="i" var="process">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td>${process.id}</td>
                                <td>${process.name}</td>
                                <td>${process.version}</td>
                                <td>${process.numInstances}</td>
                                <td><g:link class="edit btn btn-sm btn-grey" action="create" id="${process.id}">
                                    <i class="icon-trash icon-pencil"></i>
                                    <g:message code="default.button.create.label" default="Create"/>
                                </g:link></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </ul>
            </div>
            </div>
    </div>


</body>
</html>
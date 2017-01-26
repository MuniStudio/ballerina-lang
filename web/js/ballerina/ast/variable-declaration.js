/**
 * Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
define(['lodash', './node'], function(_, ASTNode){

    var VariableDeclaration = function (type, identifier) {
        ASTNode.call(this, "VariableDeclaration");
        this._type = type;
        this._identifier = identifier;
        this.initialValue = undefined;
        this.type = "VariableDeclaration";
    };

    VariableDeclaration.prototype = Object.create(ASTNode.prototype);
    VariableDeclaration.prototype.constructor = VariableDeclaration;

    VariableDeclaration.prototype.setType = function (type) {
        if(!_.isUndefined(type)){
            this._type = type;
        }
    };

    VariableDeclaration.prototype.getType = function () {
        return this._type;
    };

    VariableDeclaration.prototype.setIdentifier = function (identifier) {
        if(!_.isUndefined(identifier)){
            this._identifier = identifier;
        }
    };

    VariableDeclaration.prototype.getIdentifier = function(){
        return this._identifier;
    };

    /**
     * initialize VariableDeclaration from json object
     * @param {Object} jsonNode to initialize from
     */
    VariableDeclaration.prototype.initFromJson = function (jsonNode) {
        this.setType(jsonNode.variable_type);
        this.setIdentifier(jsonNode.variable_name);
    };

    return VariableDeclaration;
});
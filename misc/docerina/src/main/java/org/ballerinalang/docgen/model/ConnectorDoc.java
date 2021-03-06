/*
 *  Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  WSO2 Inc. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */
package org.ballerinalang.docgen.model;


import java.util.List;

/**
 * Documentable node for Connectors.
 */
public class ConnectorDoc extends Documentable {
    public final boolean isConnector;
    public final boolean isObject;
    public final List<Variable> parameters;

    /**
     * Constructor.
     * @param name connector name.
     * @param description description.
     * @param children connector actions.
     * @param parameters parameters of the connector.
     */
    public ConnectorDoc(String name, String description, List<Documentable> children, List<Variable> parameters,
                        boolean isConnector) {
        super(name, "fw-connector", description, children);
        if (!isConnector) {
            super.icon = "fw-struct";
        }
        if (isConnector) {
            for (Documentable doc : children) {
                doc.icon = "fw-action";
            }
        }
        this.parameters = parameters;
        this.isConnector = isConnector;
        this.isObject = !isConnector;
    }
}

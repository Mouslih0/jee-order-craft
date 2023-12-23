<%@ page import="com.example.ordercraftnew.Model.Client" %>
<%@ page import="com.example.ordercraftnew.Model.Produit" %>
<%@ page import="com.example.ordercraftnew.Model.CommandeProduit" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Produit produit = null;
    if(request.getAttribute("produit") != null)
    {
        produit = (Produit) request.getAttribute("produit");
    }

    CommandeProduit commandeProduit = null;
    if(request.getAttribute("commandeProduit") != null)
    {
        commandeProduit = (CommandeProduit) request.getAttribute("commandeProduit");
    }

    assert produit != null;
    assert commandeProduit != null;
%>

<html>
<head>
    <title>Gestion des produits</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<div class="min-h-full">
    <%@ include file="nav.jsp" %>
    <div class="py-10">
        <main>
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <!-- Replace with your content -->
                <div class="lg:grid lg:grid-cols-6 lg:gap-x-5">
                    <div class="space-y-6 sm:px-6 lg:px-0 lg:col-span-9">
                            <form action="<%=request.getContextPath()%>/commande-situation/add" method="post">
                                <div class="shadow sm:rounded-md sm:overflow-hidden">
                                    <div class="bg-white py-6 px-4 space-y-6 sm:p-6">
                                        <% if(commandeProduit != null){ %>
                                        <input type="hidden" name="id_cp" value="<%= commandeProduit.getId()%>" />
                                        <%}%>
                                        <% if(produit != null){ %>
                                        <input type="hidden" name="id_produit" value="<%= produit.getId()%>" />
                                        <%}
                                        %>
                                        <div>
                                            <h3 class="text-lg leading-6 font-medium text-gray-900">Quantity Information</h3>
                                            <p class="mt-1 text-sm text-gray-500">Use a permanent quantity where you can define quantity product.</p>
                                        </div>

                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="name" class="block text-sm font-medium text-gray-700">Product name</label>
                                                <input type="text" name="name" readonly disabled placeholder="name produit" value="<%= produit.getName()!=null ? produit.getName() : "" %>" id="name" autocomplete="given-name" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                            </div>

                                            <div class="col-span-6 sm:col-span-4">
                                                <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                                                <div class="mt-1">
                                                    <textarea id="description" readonly disabled name="description"  rows="3" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border border-gray-300 rounded-md" placeholder="description"><%= produit.getDescription() != null ? produit.getDescription() : "" %></textarea>
                                                </div>
                                            </div>

                                            <div class="col-span-6">
                                                <label for="quantite_produit" class="block text-sm font-medium text-gray-700">Quantity</label>
                                                <input type="number" name="quantite_produit" min="0" max="<%=produit.getQuantite_produit()%>" id="quantite_produit" placeholder="quantite" value="<%= commandeProduit.getQuantite()!=0 ? commandeProduit.getQuantite() : "" %>" autocomplete="street-address" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
                                        <button type="submit" class="bg-indigo-600 border border-transparent rounded-md shadow-sm py-2 px-4 inline-flex justify-center text-sm font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Save</button>
                                    </div>
                                </div>
                            </form>
                    </div>
                </div>
                <!-- /End replace -->
            </div>
        </main>
    </div>

</html>
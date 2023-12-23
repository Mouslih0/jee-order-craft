<%@ page import="com.example.ordercraftnew.Model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User user = null;
    if(request.getAttribute("user") != null)
    {
        user = (User) request.getAttribute("user");
    }
%>

<html>
<head>
    <title>Gestion des clients</title>
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


                        <% if(user != null){%>
                        <form action="<%=request.getContextPath()%>/user/update" method="post">
                                <%}%>
                                <% if(user == null){%>
                            <form action="<%=request.getContextPath()%>/user/add" method="post">
                                <%}%>
                                <div class="shadow sm:rounded-md sm:overflow-hidden">
                                    <div class="bg-white py-6 px-4 space-y-6 sm:p-6">
                                        <% if(user != null){ %>
                                        <input type="hidden" name="id" value="<%= user.getId()%>" />
                                        <%}%>
                                        <div>
                                            <h3 class="text-lg leading-6 font-medium text-gray-900">user Information</h3>
                                            <p class="mt-1 text-sm text-gray-500">Use a permanent address where you can receive mail.</p>
                                        </div>

                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="name" class="block text-sm font-medium text-gray-700">Name complete</label>
                                                <input type="text" name="name" placeholder="name complete" value="<%= (user != null && user.getName() != null) ? user.getName() : "" %>" id="name" autocomplete="name" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                            </div>

                                            <div class="col-span-6 sm:col-span-4">
                                                <label for="email" class="block text-sm font-medium text-gray-700">Email address</label>
                                                <input type="email" name="email" placeholder="email address" value="<%= (user != null && user.getEmail() != null) ? user.getEmail() : "" %>" id="email" autocomplete="email" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                            </div>

                                            <div class="col-span-6">
                                                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                                                <input type="password" name="password" id="password" placeholder="password" value="<%= (user != null && user.getPassword() != null) ? user.getPassword() : "" %>" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
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
function [bcutpos, bcutloop]=slicehead(node, face, varargin)
%
% [bcutpos, bcutloop]=slicehead(node, face, varargin)
%
% Slice a closed surface by a plane and extract the intersection curve as a
% polyline loop
%
% author: Qianqian Fang (q.fang at neu.edu)
%
% input:
%    node: an N x 3 array defining the 3-D positions of the mesh
%    face: an N x 3 interger array specifying the surface triangle indices;
%
% output:
%    bcutpos: the nodes ont he intersection curve
%    bcutloop: the sequential order of the nodes to form a polyline loop;
%          the last node is assumed to be connected to the first node; an
%          nan indicates the end of a loop; the intersection may contain
%          multiple loops.
%
%
% -- this function is part of brain2mesh toolbox (http://mcx.space/brain2mesh)
%    License: GPL v2 or later, see LICENSE.txt for details
%

[bcutpos,bcutvalue,bcutedges]=qmeshcut(face(:,1:3),node,node(:,1),varargin{:});
[bcutpos,bcutedges]=removedupnodes(bcutpos,bcutedges);
bcutloop=extractloops(bcutedges);

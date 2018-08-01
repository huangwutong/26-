package com.ponyjava.common.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Stack;
import java.util.TreeSet;

import org.springframework.util.Assert;

import com.jeecms.core.util.PriorityComparator;

public class SelectTreeUtils {
	public static List webTree(List<? extends SelectTree> list) {
		Assert.notNull(list);
		Generator gen = new Generator(list);
		return gen.generate();
	}

	@SuppressWarnings("unchecked")
	public static List handleTreeChild(List<? extends SelectTree> list) {
		Assert.notNull(list);
		ChildHandle childHandle = new ChildHandle(list);
		return childHandle.handle();
	}

	private static class ChildHandle {
		private List<? extends SelectTree> content;
		private Set<Long> idSet;

		public ChildHandle(List<? extends SelectTree> content) {
			Assert.notNull(content);
			this.content = content;

		}

		@SuppressWarnings("unchecked")
		private List handle() {
			collectIds();
			List<SelectTree> roots = getRoots(content, true);
			for (SelectTree r : roots) {
				findChild(r, content);
			}
			return roots;
		}

		private void collectIds() {
			idSet = new HashSet<Long>();
			for (SelectTree node : content) {
				idSet.add(node.getId());
			}
		}

		/**
		 * 获得根节点。父节点为空或父节点不再
		 * 
		 * @param content
		 * @return
		 */
		private List<SelectTree> getRoots(List<? extends SelectTree> content,
				boolean isContain) {
			List<SelectTree> roots = new ArrayList<SelectTree>();
			SelectTree p = null;
			for (SelectTree n : content) {
				p = n.getTreeParent();
				if (p == null || p.getId() == null
						|| !idSet.contains(p.getId())) {
					roots.add(n);
				}
			}
			return roots;
		}

		/**
		 * 获得子节点
		 * 
		 * @param parent
		 * @param content
		 */
		@SuppressWarnings("unchecked")
		private void findChild(SelectTree parent,
				List<? extends SelectTree> content) {
			Set<SelectTree> child = new TreeSet(PriorityComparator.INSTANCE);
			SelectTree p;
			for (SelectTree node : content) {
				p = node.getTreeParent();
				if (p != null && parent.getId().equals(p.getId())) {
					child.add(node);
				}
			}
			parent.setTreeChild(child);
			for (SelectTree c : child) {
				findChild(c, content);
			}
		}
	}

	private static class Generator {
		private List<? extends SelectTree> roots;

		public Generator(List<? extends SelectTree> roots) {
			this.roots = roots;
		}

		/**
		 * 生成树
		 * 
		 * @return
		 */
		public List<? extends SelectTree> generate() {
			List<SelectTree> container = new ArrayList<SelectTree>();
			Stack<Boolean> isEndList = new Stack<Boolean>();
			isEndList.add(new Boolean(true));
			for (SelectTree o : roots) {
				container = node(container, o, 0, isEndList);
			}
			return container;
		}

		private List<SelectTree> node(List<SelectTree> container,
				SelectTree node, int deep, Stack<Boolean> isEndList) {
			if (container == null) {
				container = new ArrayList<SelectTree>();
			}
			StringBuilder sb = new StringBuilder();
			// 空格列
			if (deep >= 1) {
				sb.append("&nbsp;");
			}
			// 线条列
			for (int i = 1; i < deep; i++) {
				if (!isEndList.get(i)) {
					sb.append("│");
				} else {
					sb.append("　");
				}
			}
			// 节点列
			if (deep == 0) {
				// 父节点
				sb.append("♀");
			} else if (isEndList.get(deep)) {
				sb.append("└");
			} else {
				sb.append("├");
			}
			sb.append(node.getTreeName());
			node.setSelectTree(sb.toString());
			container.add(node);
			// 子节点
			Set<? extends SelectTree> cld = node.getTreeChild();
			if (cld != null) {
				for (Iterator<? extends SelectTree> it = cld.iterator(); it
						.hasNext();) {
					SelectTree o = it.next();
					// 入栈
					isEndList.push(!it.hasNext());
					node(container, o, deep + 1, isEndList);
					// 出栈
					isEndList.pop();
				}
			}
			return container;
		}
	}
}
